<?php

namespace App\Transformers;

use App\Models\Movies;

class MoviesToDto
{
    public static function provideTransformer(Movies $movie)
    {
        return match ($movie->type) {
            'Comedy' => ['id' => $movie->id, 'name' => $movie->name, 'category' => 'Comedy / Drama',],
            'Mystery/Crime' => ['id' => $movie->id, 'name' => $movie->name, 'category' => 'Mystery / Crime',],
            default => ['id' => $movie->id, 'name' => $movie->name, 'category' => $movie->type,],
        };
    }
}
