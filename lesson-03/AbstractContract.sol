// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

abstract contract A {
    uint public x;
    
    constructor(uint _x) {
        x = _x;
    }
} 

contract B is A{
    constructor(uint _x) A(_x) {}
}

contract C is A(1){
    constructor() {}
}