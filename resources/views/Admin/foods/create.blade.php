@extends('layouts.app')

@section('content')
    <h3 class="ml-2">Enter food information</h3>
    <form action="" method="post" enctype="multipart/form-data">
        @csrf
        <input class="form-control" type="file" name="image">
        <input class="form-control" type="text" name="name" placeholder="Enter food's name">
        <input class="form-control" type="text" name="count" placeholder="Enter food's count">
        <input class="form-control" type="text" name="description" placeholder="Enter food's description">
        <div>
            <label>Choose a category:</label>
            <select name="category_id" class="form-select">
                @foreach($categories as $category)
                    <option value="{{$category->id}}">{{$category->name}}</option>
                @endforeach
            </select>
        </div>
        @if($errors->any())
            <div>
                @foreach($errors->all() as $error)
                    <p class="text-danger">{{$error}}</p>
                @endforeach
            </div>
        @endif
        <button type="submit" class="btn btn-primary mx-2 my-2">
            Submit
        </button>
    </form>

@endsection
