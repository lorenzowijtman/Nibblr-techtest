<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class TodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return Todo::all();
    }

    /**
     * Show the form for creating a new resource.
     * Returns nothing right now with appropriate status code
     * @return Response
     */
    public function create()
    {
        return response()->json('', 204);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $request->validate( [
            'title' => 'required|max:255',
            'description' => 'required|max:255'
        ]);

        return Todo::create($request->all());

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $todo = Todo::findOrFail($id);
        return $todo;
    }

    /**
     * Show the form for editing the specified resource.
     * Returns nothing right now with appropriate status code
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        response()->json('', 204);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $request->validate( [
            'title' => 'required|max:255',
            'description' => 'required|max:255'
        ]);

        $todo = Todo::findOrFail($id);
        $todo->update($request->all());
        return response()->json('', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $todo = Todo::findOrFail($id);
        $todo->delete();

        return 200;
    }
}
