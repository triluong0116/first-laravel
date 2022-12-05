@extends('layouts.app')

@section('content')
    <h3 class="ml-2">Update a food</h3>
    <form action="" method="post">
        @csrf
        <input
            class="form-control"
            type="text" name="name"
            value="{{$food->name}}"
            placeholder="Enter food's name">
        <input
            class="form-control"
            type="number" name="count"
            value="{{$food->count}}"
            placeholder="Enter food's count">
        <input
            class="form-control"
            type="text" name="description"
            value="{{$food->description}}"
            placeholder="Enter food's description">
        <button type="submit" class="btn btn-primary mx-2 my-2">
            Submit
        </button>
    </form>
@endsection
