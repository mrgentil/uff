<?php


namespace App\Repository;

use App\Models\Project;


class ProjectRepository
{
    public function getLatest(?int $limit = 10)
    {
        return Project::query()
            ->paginate($limit);
    }

    public function getProject(string $slug)
    {
        $id = explode('-', $slug)[0];
        $slug = substr($slug, strpos($slug, explode('-', $slug)[1]));
        return Project::query()
            ->where('id', $id)
            ->where('slug', $slug)
            ->firstOrFail();
    }

    public function getPreviousRecord(string $slug)
    {
        $id = $this->getProjectIdFromSlug($slug);
        return Project::query()

            ->where('id', '<', $id)
            ->orderBy('id', 'desc')
            ->first();
    }

    public function getNextRecord(string $slug)
    {
        $id = $this->getProjectIdFromSlug($slug);
        return Project::query()
            ->where('id', '>', $id)
            ->orderBy('id', 'desc')
            ->first();
    }

    public function getRelatedProjects(string $slug,  ?int $limit = 4)
    {
        $id = $this->getProjectIdFromSlug($slug);

        return Project::query()
            ->where('id', '<>', $id)
            ->orderBy('id', 'desc')
            ->limit($limit)->get();
    }

    private function getProjectIdFromSlug(string $slug)
    {
        return $id = explode('-', $slug)[0];
    }


    public function getPopularProjects(int $limit = 5, string $direction = 'desc')
    {
        return Project::orderByViews($direction)->limit($limit)->get();
    }

}
