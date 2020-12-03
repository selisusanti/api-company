<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    //
	
	protected $table = 'companies';
	// protected $primaryKey = 'id';
    // public $timestamps = true;
    

	protected $fillable = [
		'name',
		'email',
		'website',
		'logo'
	];

}
