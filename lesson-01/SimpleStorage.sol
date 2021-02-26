// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

/**
 * @title SimpleStorage
 * @author Dhruvin
 * @notice Universal number access
 * @dev store, increment and decrement integer
 */ 

contract SimpleStorage {
    // state variable
    uint storedData; // 0 to (2^256 - 1), uint8,uint16,uint32 ... uint256 = uint
    address owner; // in Ethereum address is 20 bytes
    
    // declare event
    event Increment(address caller, uint storedData, uint incrementValue);
    event Decrement(address caller, uint storedData, uint decrementValue);
    
    constructor() {
        owner = msg.sender; // msg.sender is globally availble in solidity
    }
    
    // custom modifier
    modifier onlyOwner {
        if(msg.sender != owner) {
            revert();
        }
        _;
    }
    
    function set(uint _x) public onlyOwner {
        storedData = _x;
    }
    
    /**
     * @notice Get the value of the storedData
     * @dev Reads the value of storedData
     * @return the value of storedData
     */
    function get() public view returns(uint) {
        return storedData;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    /**
     * @notice Adds a number to stored number
     * @dev Increments storedData by _n
     * @param _n The number to increment storedData
     */ 
    function increment(uint8 _n) public {
        storedData += uint256(_n);
        emit Increment(msg.sender, storedData, _n);
    }
    
    function decrement(uint _n) public {
        storedData -= _n;
        emit Decrement(msg.sender, storedData, _n);
    }
}