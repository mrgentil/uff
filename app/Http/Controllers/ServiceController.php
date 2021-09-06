<?php

namespace App\Http\Controllers;

use App\Models\Service;
use App\Repository\BlogRepository;
use App\Repository\ServiceRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ServiceController extends Controller
{
    /**
     * @var ServiceRepository
     */
    private $serviceRepository;
    private $blogRepository;

    /**
     * ServiceRepository constructor.
     * @param ServiceRepository $projectRepository
     */
    /**
     * BlogController constructor.
     * @param BlogRepository $blogRepository
     */
    public function __construct(ServiceRepository $serviceRepository , BlogRepository $blogRepository)
    {

        $this->serviceRepository = $serviceRepository;
        $this->blogRepository = $blogRepository;
    }
    //
    public function index()
    {
        $services = Service::all();
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('services.index',compact('services','posts_footer'));
    }

    public function show(string $slug)
    {
        $service = $this->serviceRepository->getService($slug);
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('services.show', compact('service','posts_footer'));
    }
}



