// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract HelloWorld {
    uint private simpleInt;
    
    function getValue() public view returns(uint){
        return simpleInt;
    }
    
    function setValue(uint _value) public {
        simpleInt = _value;
    }
}

contract Client {
    address public obj;
    
    function useExistingAddress() public returns(uint) {
        HelloWorld myObj = new HelloWorld();
        obj = address(myObj);
        myObj.setValue(10);
        return myObj.getValue();
    }
}