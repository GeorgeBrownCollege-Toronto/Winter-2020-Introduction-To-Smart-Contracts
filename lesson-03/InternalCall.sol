// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract InternalCall {
    function fn1(uint _a, uint _b) public pure returns(uint) {
        return _sum({_b:_a, _a:_b});
    }
    
    function _sum(uint _a, uint _b) internal pure returns(uint) {
        return _a + _b;
    }
}