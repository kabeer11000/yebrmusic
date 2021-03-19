<?php

class Storage
{
    private $store = array();

    function set($key, $value)
    {
        $this->store[$key] = $value;
    }

    function get($key)
    {
        return $this->store[$key];
    }

    function delete($key)
    {
        unset($this->store[$key]);
    }
}
