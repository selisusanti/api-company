<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    //
	
	protected $table = 'employees';
	// protected $primaryKey = 'id';
    // public $timestamps = true;
    

	protected $fillable = [
		'first_name',
		'last_name',
		'id_company',
		'email',
		'phone'
	];

}
