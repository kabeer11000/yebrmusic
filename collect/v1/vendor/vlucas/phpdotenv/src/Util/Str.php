<?php

declare(strict_types=1);

namespace Dotenv\Util;

use GrahamCampbell\ResultType\Error;
use GrahamCampbell\ResultType\Result;
use GrahamCampbell\ResultType\Success;
use PhpOption\Option;
use function in_array;
use function mb_convert_encoding;
use function mb_list_encodings;
use function mb_strlen;
use function mb_strpos;
use function mb_substr;
use function sprintf;

/**
 * @internal
 */
final class Str
{
    /**
     * This class is a singleton.
     *
     * @codeCoverageIgnore
     *
     * @return void
     */
    private function __construct()
    {
        //
    }

    /**
     * Convert a string to UTF-8 from the given encoding.
     *
     * @param string $input
     * @param string|null $encoding
     *
     * @return Result<string,string>
     */
    public static function utf8(string $input, string $encoding = null)
    {
        if ($encoding !== null && !in_array($encoding, mb_list_encodings(), true)) {
            /** @var Result<string,string> */
            return Error::create(
                sprintf('Illegal character encoding [%s] specified.', $encoding)
            );
        }

        /** @var Result<string,string> */
        return Success::create(
            $encoding === null ? @mb_convert_encoding($input, 'UTF-8') : @mb_convert_encoding($input, 'UTF-8', $encoding)
        );
    }

    /**
     * Search for a given substring of the input.
     *
     * @param string $haystack
     * @param string $needle
     *
     * @return Option
     */
    public static function pos(string $haystack, string $needle)
    {
        /** @var Option */
        return Option::fromValue(mb_strpos($haystack, $needle, 0, 'UTF-8'), false);
    }

    /**
     * Grab the specified substring of the input.
     *
     * @param string   $input
     * @param int      $start
     * @param int|null $length
     *
     * @return string
     */
    public static function substr(string $input, int $start, int $length = null)
    {
        return mb_substr($input, $start, $length, 'UTF-8');
    }

    /**
     * Compute the length of the given string.
     *
     * @param string $input
     *
     * @return int
     */
    public static function len(string $input)
    {
        return mb_strlen($input, 'UTF-8');
    }
}
