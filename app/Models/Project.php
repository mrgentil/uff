<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $fillable = ['title','image','slug','description'];
    public function getSlugLinkAttribute()
    {
        return route('projets.show', $this->id . '-' . $this->slug);
    }
}
