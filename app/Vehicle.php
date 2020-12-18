<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Deposit;

class Vehicle extends Model
{
    public function deposits()
    {
        return $this->hasMany(Deposit::class);
    }
}
