@extends('layouts.app')

@section('content')
    <h1 class="ml-2">Food detail</h1>
    <div class="row">
        <div class="col-12 col-sm-4">
            <h3 class="d-inline-block d-sm-none">{{$food->name}}</h3>
            <div class="col-12">
                <img src="{{asset('/images/'.$food->image_path)}}" class="product-image" alt="Product Image">
            </div>
        </div>
        <div class="col-12 col-sm-8">
            <h3 class="my-3">{{$food->name}}</h3>
            <hr>
            <p>Description: {{$food->description}}</p>
            <p>Count: {{$food->count}}</p>
            <p>Category: {{$food->category->name}}</p>
        </div>
    </div>
@endsection
