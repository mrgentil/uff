<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Project;
use App\Models\Service;
use App\Repository\BlogRepository;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

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
    public function index()
    {
        $projets = Project::all();
        $services = Service::all();
        $posts = $this->blogRepository->getLatest(9);
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('layouts.index',compact('projets','services','posts','posts_footer'));
    }
}
