<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Food;
use App\Models\Category;



class PagesController extends Controller
{
    public function index(){
        return view('index', [
            'title' => 'Homepage',
        ]);
    }
    public function about(){
        return view('about', [
            'title' => 'About'
        ]);
    }
}
