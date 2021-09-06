<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Repository\BlogRepository;


class BlogController extends Controller
{
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
        $posts = $this->blogRepository->getLatest(8);
        $categories = $this->blogRepository->getBlogCategories();
        $posts_footer = $this->blogRepository->getLatest(2);
        return view('blog.index', compact('posts', 'categories','posts_footer'));
    }

    public function show(string $slug)
    {
        $post = $this->blogRepository->getPost($slug);
        $categories = $this->blogRepository->getBlogCategories();
        $previous = $this->blogRepository->getPreviousRecord($slug);

        $next = $this->blogRepository->getNextRecord($slug);
        $lasts = $this->blogRepository->getLatest(5);
       // $related_posts = $this->blogRepository->getRelatedPosts($slug, $post->category_id);
        $posts_footer = $this->blogRepository->getLatest(2);

        return view('blog.show',  compact('post', 'previous', 'next',  'categories','lasts','posts_footer'));
    }
}
