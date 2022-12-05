@extends('layouts.app')

@section('content')
    <a href="admin/foods" class="text-uppercase mr-2 float-right" >
        Product Management <i class="fa-solid fa-arrow-right"></i>
    </a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Count</th>
        </tr>
        </thead>
        <tbody>
        @foreach($foods as $food)
            <tr>
                <td>{{ $food->id }}</td>
                <td>
                    <a href="admin/foods/{{ $food->id }}" title="Show detail">
                        {{-- "show details" --}}
                        {{ $food->name }}
                    </a></td>
                <td>{{ $food->description }}</td>
                <td>{{ $food->count }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
