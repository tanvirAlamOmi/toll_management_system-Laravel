import os, shutil, sys
from optparse import OptionParser

BLUE = '\033[34m'
NORM = '\033[0m'

#
# Define Boolean Flags
#
parser = OptionParser()

#
# Set up as brand new project (empty directory)
#
parser.add_option(
    "-n", "--new",
    action="store_true",
    default=False,
    dest="new_project",
    help="This will set up a brand new project in an empty directory (no repository)."
)

# Install dependencies only.
parser.add_option(
    "-d", "--dependencies-only",
    action="store_true",
    default=False,
    dest="dependencies_only",
    help="Only install dependencies."
)

# Update .env file only.
parser.add_option(
    "-e", "--env-only",
    action="store_true",
    default=False,
    dest="env_only",
    help="Only update .env file."
)

# Create database only.
parser.add_option(
    "-b", "--db-only",
    action="store_true",
    default=False,
    dest="db_only",
    help="Only create database."
)

# Install Passport
parser.add_option(
    "-p", "--passport",
    action="store_true",
    default=False,
    dest="setup_passport",
    help="This will install passport and set up basic user api crud."
)

# Link Valet only.
parser.add_option(
    "-v", "--vl-only",
    action="store_true",
    default=False,
    dest="vl_only",
    help="Only link valet."
)

(options, args) = parser.parse_args()

#
# Set environment variables
#
project_short_name = os.path.basename(os.getcwd()).strip()
project_name = raw_input('What is the name of this project? (e.g. Midwestern Interactive):\n')
database_user = raw_input('Does MySQL need a user other than root? If so what? Hit enter to leave as root.\n')
database_pass = raw_input('Does MySQL need a password? If so what? Hit enter to leave blank.\n')

environment_data = {
    "APP_NAME": '"' + project_name + '"',
    "APP_URL": 'http://' + project_short_name + '.loc',
    "DB_DATABASE": project_short_name.replace('-', '_'),
    "DB_USERNAME": 'root' if not database_user else database_user,
    "DB_PASSWORD": database_pass
}

#
# Set the depencies for the project
#
dependencies = [
    'mwi/laravel-kit',
    'mwi/laravel-crud',
    'squizlabs/php_codesniffer --dev',
    'laravel/passport'
]

#
# If this is a new project, install laravel
#
if (options.new_project):
    print(BLUE + "\nInstalling Laravel\n" + NORM)
    os.system('laravel new')

if (not os.path.exists('composer.json')):
    print(BLUE + 'You must add -n option in order to use setup' + NORM)
    sys.exit()

#
# A method for updating lines in an existing file
# find and replace arguments must be type list
#
def update_file(filepath, find = [], replace = []):
    if (not isinstance(find, list) or not isinstance(replace, list) or len(find) != len(replace)):
        return

    # Read in the file
    with open(filepath, 'r') as file:
      filedata = file.read()

    # Replace the target string
    for line in find:
        filedata = filedata.replace(line, replace[find.index(line)])

    # Write the file out again
    with open(filepath, 'w') as file:
      file.write(filedata)

def setup_dependencies():
    # Downloads Composer dependencies
    print(BLUE + "\nInstalling composer packges\n" + NORM)
    if (options.new_project):
        os.system('composer require ' + ' '.join(dependencies))
    else:
        os.system('composer install')

    # Downloads Node dependencies
    print(BLUE + "\nInstalling NPM packges\n" + NORM)
    os.system('npm install')
    os.system('npm install cross-env')

def setup_env():
    # Builds out the environment file from the example env.
    new_environment = open('./.env', 'w+')
    environment = open('./.env.example', 'r')

    print(BLUE + "\nCreating .env file\n" + NORM)
    for line in environment:
        if (line.split('=')[0] in environment_data):
            new_environment.write(line.split('=')[0] + "=" + environment_data[line.split('=')[0]] + "\n")
        else:
            new_environment.write(line)

    new_environment.close()
    environment.close()

    # Update example env with correct environment data. This is becasue we will use example env as master env in the repository.
    shutil.copyfile('./.env', './.env.example')

    print(BLUE + "\nGenerating app key\n" + NORM)
    os.system('php artisan key:generate')

def setup_passport():
    # Configure Passport
    print(BLUE + "\nInstalling Passport\n" + NORM)
    os.system('php artisan passport:install')

    update_file('./app/User.php', [
        'use Notifiable;',
        'use Illuminate\\Notifications\\Notifiable;'
    ], [
        'use Notifiable, HasRoles, HasApiTokens;',
        'use Illuminate\\Notifications\\Notifiable;\nuse Spatie\\Permission\\Traits\\HasRoles;\nuse Laravel\\Passport\\HasApiTokens;'
    ])
    update_file('./app/Providers/AuthServiceProvider.php', [
        'use Illuminate\\Support\\Facades\\Gate;',
        '$this->registerPolicies();'
    ], [
        'use Laravel\\Passport\\Passport;\nuse Illuminate\\Support\\Facades\\Gate;',
        '$this->registerPolicies();\n\nPassport::routes();'
    ])
    update_file('./config/auth.php', [
        "'driver' => 'token'",
    ], [
        "'driver' => 'passport'"
    ])

    # Create API UserCrud
    print(BLUE + "\nCreate User API Crud\n" + NORM)
    os.system('php artisan make:crud User Users --api --no-migration')
    shutil.copyfile('UserRequest.php', './App/Http/Requests/UserRequest.php')

    # Set Up Tests
    shutil.copyfile('TestCase.php', './tests/TestCase.php')
    update_file('./phpunit.xml', [
        '<server name="APP_ENV" value="testing"/>'
    ], [
        '<server name="APP_ENV" value="testing"/>\n\n<env name="DB_DATABASE" value=":memory:"/>\n\n<env name="DB_CONNECTION" value="sqlite"/>'
    ])
    
    
def setup_db():
    # Builds out the database
    print(BLUE + "\nCreating database\n" + NORM)
    os.system('mysql -u root -e \'CREATE DATABASE IF NOT EXISTS `'+environment_data['DB_DATABASE']+'` CHARACTER SET utf8 COLLATE utf8_general_ci\'')

    # Setup MWI Laravel Kit
    if (options.new_project):
        print(BLUE + "\nInstall MWI Laravel Kit\n" + NORM)
        os.system('php artisan mwi:install')

        setup_passport()
        
        # Update database seeder
        print(BLUE + "\nUpdating files for permsisions and users seeder\n" + NORM)
        update_file('./database/seeds/DatabaseSeeder.php', ['// $this->call(UsersTableSeeder::class);'], ["$this->call(RolesAndPermissionsSeeder::class);\n\t\t$this->call(UsersTableSeeder::class);"])

    # Migrate and Seed Project.
    print(BLUE + "\nMigrating and seeding database\n" + NORM)
    os.system('composer dump-autoload && php artisan migrate:fresh --seed')

def build_tools():
    # Builds out files
    print(BLUE + "\nBuilding assets\n" + NORM)
    os.system('npm run dev')

def valet_link():
    # Sets up the url
    print(BLUE + "\nAttempting to open a local url tunnel, please type in your password!\n" + NORM)
    os.system('sudo valet link ' + project_short_name)

    print(BLUE + "\nYou can now access your site at " + environment_data['APP_URL'] + "\n" + NORM)

if (options.dependencies_only):
    setup_dependencies()
elif (options.env_only):
    setup_env()
elif (options.db_only):
    setup_db()
elif (options.vl_only):
    valet_link()
else:
    setup_dependencies()
    setup_env()
    setup_db()
    build_tools()
    valet_link()
