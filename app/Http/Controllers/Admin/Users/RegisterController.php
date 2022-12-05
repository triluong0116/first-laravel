<?php

namespace App\Http\Controllers\Admin\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class RegisterController extends Controller
{
    public function index()
    {
        return view('admin.users.register',[
            'title' => 'Register new account',
        ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'email' => 'required|email:filter',
            'password' => 'required|min:8',
            'retype_password' => 'same:password|min:8',
            'terms' => 'required'
        ]);
        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password')),
        ]);
        $user->save();
        echo "<script>
                alert('Register successful!');
                window.location.href='/admin/users/login';
            </script>";
    }
}
