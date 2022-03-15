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
            $table->string('middle_name');
            $table->string('suffix');

            $table->integer('status'); // 0-4: 1T-5T; 5: RD;
            $table->integer('network'); // 0: ym; 1: m; 2: yw; 3: w;
            
            $table->string('address');
            $table->string('birthday');
            $table->integer('age');
            $table->integer('position'); // 0: disciple; 1: leader; 2: primary;
            
            $table->integer('cell_leader_id');
            $table->integer('primary_leader_id');

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
