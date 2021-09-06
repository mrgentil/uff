<?php

namespace App\Models;

use App\Commentaire;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Jenssegers\Date\Date;
use Laravelista\Comments\Commentable;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class Post extends Model
{
    use HasFactory,Translatable,
        Resizable, Commentable;

    protected $translatable = ['title', 'seo_title', 'excerpt', 'body', 'slug', 'meta_description', 'meta_keywords'];

    const PUBLISHED = 'PUBLISHED';

    protected $guarded = [];

    public $dates = ['created_at', 'updated_at'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        Date::setLocale('fr');
    }
    public function getImageAttribute($image)
    {
        if (Str::startsWith($image, 'http://') || Str::startsWith($image, 'https://')) {
            return asset(Voyager::image($image));
        }
        return Voyager::image($image);

    }

    public function getSlugLinkAttribute()
    {
        $post = $this;
        return route('blog.show', $post->id . '-' . $this->slug);
    }

    public function getCreatedAtAttribute($created_at)
    {
        return Date::make($created_at)->format(' j F, Y');
    }
    /* public function getCreatedAtAttribute($created_at)
     {
         dd($created_at);
         return $created_at->diffForHumans();
     }*/
    public function save(array $options = [])
    {
        // If no author has been assigned, assign the current user's id as the author of the post
        if (!$this->author_id && Auth::user()) {
            $this->author_id = Auth::user()->getKey();
        }

        parent::save();
    }

    public function authorId()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'author_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(Voyager::modelClass('User'), 'author_id', 'id');
    }

    /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopePublished(Builder $query)
    {
        return $query->where('status', '=', static::PUBLISHED);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo(Voyager::modelClass('Category'));
    }



    public function getCreatedAtFormatTwoAttribute()
    {
        return title_case((new Carbon($this->published_at))->translatedFormat('d/m/Y - h:i'));
    }
    public function getMonthAttribute()
    {
        return (new Carbon($this->published_at))->translatedFormat('F');
    }
    public function getMonthTwoAttribute()
    {
        return (new Carbon($this->published_at))->translatedFormat('m');
    }
    public function getDayAttribute()
    {
        return (new Carbon($this->published_at))->translatedFormat('d');
    }

    public function getYearAttribute()
    {
        return (new Carbon($this->published_at))->translatedFormat('Y');
    }

    public function comments()
    {
        return $this->hasMany(Commentaire::class);
    }

    public function getTotalCommentAttribute()
    {
        return $this->comments()->count() > 1 ? $this->comments()->count() . ' commentaires' : $this->comments()->count() . ' commentaire';
    }

}
