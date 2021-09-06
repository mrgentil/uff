<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Post;
use App\Repository\ProjectRepository;
use Illuminate\Http\Request;
use App\Repository\BlogRepository;

class ProjetController extends Controller
{
    /**
     * @var ProjectRepository
     */
    private $projectRepository;
    private $blogRepository;

    /**
     * ProjectRepository constructor.
     * @param ProjectRepository $projectRepository
     */
    /**
     * BlogController constructor.
     * @param BlogRepository $blogRepository
     */
    public function __construct(ProjectRepository $projectRepository, BlogRepository $blogRepository)
    {

        $this->projectRepository = $projectRepository;
        $this->blogRepository = $blogRepository;
    }
    //
    public function index()
    {
        $projets = Project::all();
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('projets.index',compact('projets','posts_footer'));
    }

    public function show(string $slug)
    {
        $projet = $this->projectRepository->getProject($slug);
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('projets.show', compact('projet','posts_footer'));
    }
}
