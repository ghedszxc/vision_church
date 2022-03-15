<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttendancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('attendances', function (Blueprint $table) {
            $table->increments('id');

            $table->unsignedInteger('disciple_id')->nullable();
            $table->unsignedInteger('event_id')->nullable();

            $table->integer('status'); // 0-4: 1T-5T; 5: RD;

            $table->timestamps();

            //Foreign keys
            $table->foreign('disciple_id')
                ->references('id')->on('disciples')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            //Foreign keys
            $table->foreign('event_id')
                ->references('id')->on('events')
                ->onDelete('cascade')
                ->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attendances');
    }
}
