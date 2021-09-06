<?php


namespace App\Repository;

use App\Models\Service;


class ServiceRepository
{
    public function getLatest(?int $limit = 10)
    {
        return Service::query()
            ->paginate($limit);
    }

    public function getService(string $slug)
    {
        $id = explode('-', $slug)[0];
        $slug = substr($slug, strpos($slug, explode('-', $slug)[1]));
        return Service::query()
            ->where('id', $id)
            ->where('slug', $slug)
            ->firstOrFail();
    }

    public function getPreviousRecord(string $slug)
    {
        $id = $this->getServiceIdFromSlug($slug);
        return Service::query()

            ->where('id', '<', $id)
            ->orderBy('id', 'desc')
            ->first();
    }

    public function getNextRecord(string $slug)
    {
        $id = $this->getServiceIdFromSlug($slug);
        return Service::query()
            ->where('id', '>', $id)
            ->orderBy('id', 'desc')
            ->first();
    }

    public function getRelatedServices(string $slug,  ?int $limit = 4)
    {
        $id = $this->getServiceIdFromSlug($slug);

        return Service::query()
            ->where('id', '<>', $id)
            ->orderBy('id', 'desc')
            ->limit($limit)->get();
    }

    private function getServiceIdFromSlug(string $slug)
    {
        return $id = explode('-', $slug)[0];
    }


    public function getPopularServices(int $limit = 5, string $direction = 'desc')
    {
        return Service::orderByViews($direction)->limit($limit)->get();
    }

}
