<?php

namespace Tests;

use App\Calculator;
use PHPUnit\Framework\TestCase;

class CalculatorTest extends TestCase
{
    private $calculator;

    protected function setUp(): void
    {
        $this->calculator = new Calculator();
    }

    public function testAdd(): void
    {
        $this->assertEquals(4, $this->calculator->add(2, 2));
    }

    public function testSubtract(): void
    {
        $this->assertEquals(0, $this->calculator->subtract(2, 2));
    }
}
