<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Vehicle;

class Deposit extends Model
{
    public function vehicle()
    {
    	return $this->belongsTo(Vehicle::class);
    }
}
