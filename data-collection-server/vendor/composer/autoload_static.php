<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitd70a6db48f526109ff18a794585284e8
{
    public static $prefixLengthsPsr4 = array (
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
    );

    public static $prefixesPsr0 = array (
        'B' => 
        array (
            'Bramus' => 
            array (
                0 => __DIR__ . '/..' . '/bramus/router/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitd70a6db48f526109ff18a794585284e8::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitd70a6db48f526109ff18a794585284e8::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitd70a6db48f526109ff18a794585284e8::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
