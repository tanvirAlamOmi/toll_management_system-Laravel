<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicles', function (Blueprint $table) {
            $table->increments('id');
            $table->string('vehicle_no');
            $table->integer('company_id');
            $table->string('licence_no');
            $table->string('engin_cc');
            $table->string('engin_no');
            $table->tinyInteger('vehicle_type');
            $table->string('qr_code')->nullable();
            $table->boolean('is_permitted');
            $table->boolean('is_delete')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehicles');
    }
}
