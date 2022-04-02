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
        $user = User::create([
            'name' => $request['name'],
            'username' => $request['username'],
            'password' => bcrypt($request['password']),
        ]);


        $token = $user->createToken('myapptoken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 201);
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
        $getToken = DB::select("SELECT name FROM personal_access_tokens WHERE token = '$id'");
        return User::where('username', $getToken[0]->name)->first();
    }

    public function authLogin(Request $request)
    {
        $user = User::where('username', $request['username'])->first();
        if ($user && Hash::check($request['password'], $user['password'])){
            $getToken = DB::select("SELECT token FROM personal_access_tokens WHERE name = '$request->username'");
            !$getToken ? $user->createToken($request->username)->plainTextToken : null;

            $response = [
                'user' => $user,
                'token' => $getToken ? $getToken[0]->token : $user->createToken($request->username)->plainTextToken
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
