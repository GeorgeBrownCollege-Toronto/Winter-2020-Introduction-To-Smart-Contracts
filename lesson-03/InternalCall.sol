// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract InternalCall {
    function fn1() public pure returns(uint) {
        return sum({b:3,a:2});
    }
  
    function sum(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}