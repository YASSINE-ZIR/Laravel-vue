<?php
namespace App\Http\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
trait UserAuthTrait {
   /**
     * Store a newly country.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function user_by_id() {
         return auth()->id() ;


    }
    /**
     * update nbr_event for Country
     * @param
     * @return
     */
   
}