<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Models\Disciple;
use App\Http\Requests\StoreDiscipleRequest;
use App\Http\Requests\UpdateDiscipleRequest;

class DiscipleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return Disciple::all();
        return Disciple::where('is_archive', 0)->get();
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
     * @param  \App\Http\Requests\StoreDiscipleRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Disciple::create($request->all());
        $discipleInfo = Disciple::create([
            'last_name' => $request['last_name'],
            'first_name' => $request['first_name'],
            'middle_name' => $request['middle_name'],
            'suffix' => $request['suffix'],
            
            'status' => $request['status'],
            'network' => $request['network'],

            'address' => $request['address'],
            'birthday' => $request['birthday'],
            'age' => $request['age'],


            'inviter_id' => $request['inviter_id'],
            'cell_leader_id' => $request['cell_leader_id'],
            'primary_leader_id' => $request['primary_leader_id']
            
        ]);
        
        return Disciple::find($discipleInfo->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Disciple  $disciple
     * @return \Illuminate\Http\Response
     */
    public function show(Disciple $disciple)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Disciple  $disciple
     * @return \Illuminate\Http\Response
     */
    public function edit(Disciple $disciple)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateDiscipleRequest  $request
     * @param  \App\Models\Disciple  $disciple
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        Disciple::where('id', $id)->update([
            'last_name' => $request['last_name'],
            'first_name' => $request['first_name'],
            'middle_name' => $request['middle_name'],
            'suffix' => $request['suffix'],
            
            'status' => $request['status'],
            'network' => $request['network'],

            'address' => $request['address'],
            'birthday' => $request['birthday'],
            'age' => $request['age'],


            'inviter_id' => $request['inviter_id'],
            'cell_leader_id' => $request['cell_leader_id'],
            'primary_leader_id' => $request['primary_leader_id']
        ]);

        return Disciple::find($id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Disciple  $disciple
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Disciple::where('id', $id)->update([
            'is_archive' => 1
        ]);

        return $id;
    }
}
