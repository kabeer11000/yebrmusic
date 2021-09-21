<?php

declare(strict_types=1);

namespace Dotenv\Store;

use Dotenv\Exception\InvalidEncodingException;
use Dotenv\Exception\InvalidPathException;

interface StoreInterface
{
    /**
     * Read the content of the environment file(s).
     *
     * @return string
     * @throws InvalidEncodingException|InvalidPathException
     *
     */
    public function read();
}
