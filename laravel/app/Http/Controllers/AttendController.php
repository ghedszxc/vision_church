<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Attend;
use App\Models\Disciple;
use App\Http\Requests\StoreAttendRequest;
use App\Http\Requests\UpdateAttendRequest;

class AttendController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreAttendRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        foreach($request['attendees'] as $attendee)
        {
            $checkAttendeeFromEvent = DB::select("SELECT * FROM attends WHERE event_id='$request->event_id' AND disciple_id='$attendee[id]'");

            if (!$checkAttendeeFromEvent) {
                $discipleInfo = Disciple::find($attendee['id']);

                Attend::create([
                    'disciple_id' => $attendee['id'],
                    'event_id' => $request['event_id'],
                    'status' => $discipleInfo['status'] < 5 ? $discipleInfo['status']+1 : $discipleInfo['status']
                ]);

                if ($discipleInfo['status'] < 5){
                    Disciple::where('id', $attendee['id'])->update([
                        'status' => $discipleInfo['status']+1
                    ]);
                }
            }
        }

        return Attend::select('*')->where('attends.event_id', $request['event_id'])->get();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Attend  $attend
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Attend::select('*')->where('attends.event_id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Attend  $attend
     * @return \Illuminate\Http\Response
     */
    public function edit(Attend $attend)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateAttendRequest  $request
     * @param  \App\Models\Attend  $attend
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAttendRequest $request, Attend $attend)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Attend  $attend
     * @return \Illuminate\Http\Response
     */
    public function destroy(Attend $attend)
    {
        //
    }

    public function addFirstTimer(Request $request)
    {
        Attend::create([
            'disciple_id' => $request['disciple_id'],
            'event_id' => $request['event_id'],
            'status' => $request['status']
        ]);
    }
}
