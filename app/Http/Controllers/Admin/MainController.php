<?php


namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Food;
use App\Models\User;
use App\Models\Category;

class MainController
{
    public function index()
    {
        $foods = Food::all();
        return view('admin.main',[
            'title' => 'Admin page',
            'foods' => $foods,
        ]);
    }
}
