// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract SimpleStorage {
    uint storedData;

    address owner;

    event Set(address indexed caller, uint indexed value);
    event Increment(address indexed caller, uint indexed value);
    event Decrement(address indexed caller, uint indexed value);

    constructor() {
        owner = msg.sender;
    }

    function set(uint _x) public {
        storedData = _x;
        emit Set(msg.sender, _x);
    }

    function get() view public returns (uint) {
        return storedData;
    }
    
    function increment (uint _n) public {
        storedData = storedData + _n;
        emit Increment(msg.sender, _n);
    }
    
    function decrement (uint _n) public {
        storedData = storedData - _n;
        emit Decrement(msg.sender, _n);
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}
