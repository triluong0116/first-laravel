@extends('layouts.app')

@section('content')
    <a href="/admin/foods/create"
       class="btn btn-primary mx-2 my-2"
       role="button">
        Add a new Food
    </a>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Count</th>
                <th>Create</th>
                <th>Last update</th>
                <th style="width: 150px"> </th>
            </tr>
        </thead>
        <tbody>
            <tr>
            @foreach ($foods as $food)
                <td>
                    {{ $food->id }}
                </td>
                <td class="ms-2 me-auto">
                    <a href="/admin/foods/{{ $food->id }}" title="Show detail">
                        {{-- "show details" --}}
                        {{ $food->name }}
                    </a>
                </td>
                <td>
                    {{ $food->description }}
                </td>
                <td>
                    {{ $food->count }}
                </td>
                <td>
                    {{ $food->created_at }}
                </td>
                <td>
                    {{ $food->updated_at }}
                </td>
                <td>
                    <a href="/admin/foods/edit/{{ $food->id }}" class="btn btn-warning" title="Edit"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#" onclick="removeRow({{$food->id}},'/admin/foods/destroy')" class="btn btn-danger" title="Edit"><i class="fa-solid fa-trash"></i></a>
                </td>
            </tr>
        </tbody>
        @endforeach
    </table>
@endsection
