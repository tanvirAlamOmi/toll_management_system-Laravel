<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
class TestScheduler extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command_test:run_test_schedule';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description: testing scheduler';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {

            DB::table('deposits')->insert([ 
                'deposit_no' => 9,
                'vehicle_id' => 1,
                'user_id' => 1,
                'deposit_type' =>1 ,
                'amount' =>100 ,
            ]);
        
        // $this->info('scheudler have run on command');
    }
}
