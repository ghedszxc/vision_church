<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDisciplesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disciples', function (Blueprint $table) {
            $table->increments('id');
            
            $table->string('last_name');
            $table->string('first_name');
            $table->string('middle_name')->nullable();
            $table->string('suffix')->nullable();

            $table->integer('status'); // 0-4: 1T-5T; 5: RD;
            $table->integer('network'); // 0: ym; 1: m; 2: yw; 3: w;
            
            $table->string('address');
            $table->string('birthday')->nullable();
            $table->integer('age')->default(0);
            
            $table->integer('inviter_id')->default(0);
            $table->integer('cell_leader_id')->default(0);
            $table->integer('primary_leader_id')->default(0);
            
            $table->integer('is_archive')->default(0);

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
        Schema::dropIfExists('disciples');
    }
}
