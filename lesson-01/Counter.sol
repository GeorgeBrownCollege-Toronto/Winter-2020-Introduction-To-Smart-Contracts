// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Counter {
    // state variable - with visibility
    uint private value;
    
    function initialize(uint x) public { // non-payable function
        value = x;
    }
    
    function get() public view returns(uint){
        return value;
    }
    
    function increment(uint n) public { // non-payable function
        value = value + n;
    }
    
    function decrement(uint n) public { // non-payable function
        value = value - n;
    }
}
