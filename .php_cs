<?php

use Symfony\CS\FixerInterface;

$finder = Symfony\CS\Finder\DefaultFinder::create()
    ->in(__DIR__)
;

return Symfony\CS\Config\Config::create()
    ->finder($finder)
;