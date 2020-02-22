pragma solidity ^0.5.16;

import "./Regulator.sol";
import "./Ownable.sol";

contract Bank is Ownable,Regulator{
    
    uint public value;
    
    constructor(uint amount) public{
        value = amount;
    }
    
    function deposit(uint amount) public {
        value = value + amount; //or  value += amount;
    }
    
    function withdraw(uint amount) public onlyOwner returns(bool){
        if(checkValue(amount)){
            value = value - amount; // or value -= amount;
            return true;
        }
        return false;
    }
    
    function checkValue(uint amount) public returns(bool){
        // if(amount > value){
        //     return false;
        // }
        // return true;
        // or
        return amount <= value;
    }
    
    function loan() public returns(bool) {
        return value > 0;
    }
}