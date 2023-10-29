<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workflow extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'phone',
        'task',
        'user_id',
        'type',
        'details',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
