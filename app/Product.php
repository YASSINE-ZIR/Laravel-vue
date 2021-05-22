<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class Product extends Model
{
    //
    protected $fillable = [
        'name', 'slug','description','image','price','user_id ','category_id','created_at','update_at'
    ];
    public function category()
    {
        return $this->belongsTo('App\Category');
    }
}
