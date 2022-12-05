<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Food;
use App\Models\Category;

class FoodsController extends Controller
{
    public function index()
    {
        $foods = Food::all();
        return view('admin.foods.index',[
            'title' => 'Food management',
            'foods' => $foods,
        ]);
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.foods.create',[
            'title' => 'Add product'
        ])->with('categories', $categories);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:foods',
            'count' => 'required|integer|min:0|max:1000',
            'category_id' => 'required',
            'image' => 'required|mimes:jpg,png,jpeg|max:5048',
        ]);

        $generatedImageName = 'image'.time().'-'.$request->name.'.'.$request->image->extension();
        // move to folder
        $request->image->move(public_path('images'), $generatedImageName);

        $food = Food::create([
            'name' => $request->input('name'),
            'count' => $request->input('count'),
            'description' => $request->input('description'),
            'category_id' => $request->input('category_id'),
            'image_path' => $generatedImageName,
        ]);
        $food->save();
        return redirect('admin/foods');
    }

    public function edit($id)
    {
        $food = Food::find($id);
        return view('admin.foods.edit',[
            'title' => 'Edit product'
        ])->with('food', $food);
    }

    public function update(Request $request, $id)
    {
        $food = Food::where('id', $id)
            ->update([
                'name' => $request->input('name'),
                'count' => $request->input('count'),
                'description' => $request->input('description')
            ]);
        return redirect('admin/foods');
    }

    public function destroy(Request $request)
    {
        $id = $request->input('id');
        $food = Food::where('id', $id)->first();
        if($food){
            return Food::where('id', $id)->delete();
        }
        return false;
    }

    public function show($id)
    {
        $food = Food::find($id);
        $category = Category::find($food->category_id);
        $food->category = $category;
        return view('admin.foods.show',[
            'title' => 'Product detail'
        ])->with('food', $food);
    }
}
