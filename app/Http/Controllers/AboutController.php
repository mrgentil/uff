<?php

namespace App\Http\Controllers;

use App\Repository\BlogRepository;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    //
    //
    private $blogRepository;

    /**
     * BlogController constructor.
     * @param BlogRepository $blogRepository
     */
    public function __construct(BlogRepository $blogRepository)
    {
        $this->blogRepository = $blogRepository;
    }
    public function index ()
    {
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('about.index',compact('posts_footer'));
    }
}
