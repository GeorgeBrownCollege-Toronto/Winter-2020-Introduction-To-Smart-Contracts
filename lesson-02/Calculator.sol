// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Calculator {
    
    uint private result;

    /* 
    mapping(address => bool) public blacklistedAddress;
    */
    
    /*
    modifier noBlackListed {
        require(!blacklistedAddress[msg.sender], "You are blacklisted");
        _;
    }
    */

    // mapping(address => uint) public balances;
    
    fallback () external payable {
        // result = 23;
        // balances[msg.sender] += msg.value;
        revert("wrong function");
    }

    /*
    fallback() external payable {
        blacklistedAddress[msg.sender] = true;
    }
    */

    //    add => 0x771602f7
    // _a = 5 => 0000000000000000000000000000000000000000000000000000000000000006
    // _b = 6 => 0000000000000000000000000000000000000000000000000000000000000005
    function add(uint _a, uint _b) public /*noBlackListed*/ returns(uint){
        result = _a + _b; 
        return result;
    }
    
    function subtract(uint _a, uint _b) public /*noBlackListed*/ returns(uint){
        result = _a - _b;
        return result;
    }
    
    function multiply(uint _a, uint _b) public /*noBlackListed*/ returns(uint){
        result = _a * _b;
        return result;
    }
    
    function divide(uint _a, uint _b) public /*noBlackListed*/ returns(uint){
        result = _a / _b;
        return result;
    }
    
    function getResult() public view returns(uint) {
        return result;
    }
    
    function pow(uint _mantisaa, uint _exponent) public /*noBlackListed*/ pure 
    returns(uint,uint,uint){
        uint _result = _mantisaa ** _exponent;
        return (_result,_mantisaa,_exponent);
    }
}

