<?php

namespace App\Http\Controllers;

use App\Product;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Str;
use Auth ;
use Illuminate\Contracts\Support\Jsonable;
use App\Http\Traits\UserAuthTrait;

class ProductController extends Controller

{
    use UserAuthTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $products=Product::orderByDesc('created_at')->with('category')->paginate(4);
      return $products ;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $v = Validator::make($request->all(), [
            'name' => 'required|min:3',
            'description' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'price'=>'required'
        ]);
        if ($v->fails())
        {
            return response()->json([
                'status' => 'error',
                'errors' => $v->errors()
            ], 422);
        }
        $imageName = time().'.'.$request->image->extension();  
             $request->image->move(public_path('storage/products'), $imageName);
        $Product = Product::create([
            'name'=>$request->name,
            'description' =>$request->name,
            "image"=>$imageName,
            "price"=>$request->price,
            "category_id"=>$request->category_id,
            "user_id"=>$request->user_id,
            'slug'=>Str::slug($request->name, '-'),
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show( $slug)
    {
        //
        $product=Product::where('slug',$slug)->get() ;
        return $product ;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$product)
    {
        //
        $product = Product::find($product);
        $product->update([
            'name'=>$request->name,
            'description' =>$request->description,
            // "image"=>$request->name,
            "price"=>$request->price,
            "category_id"=>$request->category_id,
            "user_id"=>auth()->id(),
            'slug'=>Str::slug($request->name, '-'),
        ]);

        return $request->all();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        //
        $product = Product::find($id);
        $product->delete();

        return response()->json('Product deleted!');
    }
}
