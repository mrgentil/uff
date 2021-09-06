<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $fillable = ['title','image','slug','description','excerpt'];
    public function getSlugLinkAttribute()
    {
        return route('services.show', $this->id . '-' . $this->slug);
    }
}
