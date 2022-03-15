<?php

namespace App\Http\Controllers;

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
        return 'gerard pogi';
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
    public function store(StoreDiscipleRequest $request)
    {
        //
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
