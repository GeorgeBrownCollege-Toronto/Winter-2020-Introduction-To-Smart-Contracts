pragma solidity ^0.5.16;

import "./bank_interface.sol";

contract visibility is bankInterface{
    
    function a(uint val) public view returns(uint){
        return this.f(val);
    }
    
    function f(uint val) external pure returns(uint){
        return val;
    }
    
        function withdraw(address acount, uint amt) public returns(bool){
            return true;
        }

}