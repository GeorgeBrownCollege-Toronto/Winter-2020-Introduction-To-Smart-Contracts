// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Calculator {
    
    uint private result;

    // mapping(address => uint) public balances;
    
    fallback () external payable {
        // result = 23;
        // balances[msg.sender] += msg.value;
        revert("wrong function");
    }
    //    add => 0x771602f7
    // _a = 5 => 0000000000000000000000000000000000000000000000000000000000000006
    // _b = 6 => 0000000000000000000000000000000000000000000000000000000000000005
    function add(uint _a, uint _b) public returns(uint){
        result = _a + _b; 
        return result;
    }
    
    function subtract(uint _a, uint _b) public returns(uint){
        result = _a - _b;
        return result;
    }
    
    function multiply(uint _a, uint _b) public returns(uint){
        result = _a * _b;
        return result;
    }
    
    function divide(uint _a, uint _b) public returns(uint){
        result = _a / _b;
        return result;
    }
    
    function getResult() public view returns(uint) {
        return result;
    }
    
    function pow(uint _mantisaa, uint _exponent) public pure 
    returns(uint,uint,uint){
        uint _result = _mantisaa ** _exponent;
        return (_result,_mantisaa,_exponent);
    }
}

