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
        return Disciple::all();
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
        Disciple::create([
            'last_name' => 'alix',
            'first_name' => 'raymond',
            'middle_name' => 'mmmm',
            'suffix' => 'jrrr',
            
            'address' => 'abangan sur',
            'age' => 0,
            'birthday' => '10-10-1023',

            'status' => 0,
            'postion' => 0,
            'network' => 0,

            'cell_leader_id' => 0,
            'primary_leader_id' => 0,
            
            
        ]);
        return $request->all();
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
    public function update(UpdateDiscipleRequest $request, Disciple $disciple)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Disciple  $disciple
     * @return \Illuminate\Http\Response
     */
    public function destroy(Disciple $disciple)
    {
        //
    }
}
