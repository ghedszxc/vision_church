<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use App\Models\User;
use App\Http\Requests\StoreAttendRequest;
use App\Http\Requests\UpdateAttendRequest;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::select('id', 'name', 'username')->get();
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
        try {
            $user = User::create([
                'name' => $request['name'],
                'username' => $request['username'],
                'password' => bcrypt($request['password']),
            ]);

            return User::select('id', 'name', 'username')->where('id', $user->id)->first();

        } catch (\Illuminate\Database\QueryException $exception) {
            return [
                'status' => 'err',
                'message' => $exception->errorInfo[2]
            ];
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Attend  $attend
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

    public function getAuthuser($id)
    {
        return User::select('id', 'name', 'username')->where('username', $id)->first();
    }

    public function authLogin(Request $request)
    {
        $user = User::where('username', $request['username'])->first();
        if ($user && Hash::check($request['password'], $user['password'])){

            // User::where('id', $user['id'])->update([ 'is_online' => 1 ]);
            $response = [
                'user' => $user,
                'token' => $user->createToken('myToken')->plainTextToken
            ];

            return response($response, 201);
        } else {
            return 'Incorrect credentials';
        }
    }

    public function authLogout(Request $request)
    {
        // auth()->user()->tokens()->delete();
    }
}
