// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(10);
        // counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 11);
        emit log_named_int("The value is: ", 11);
    }

    function testSetNumber(int x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testGetCount() public {
        int value = counter.getNumber();
        assertEq(value, 10);
        emit log_named_int("The value is: ", value);
    }
}
