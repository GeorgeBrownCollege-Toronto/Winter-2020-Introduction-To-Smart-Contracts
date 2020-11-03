// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract ParentContract {
    uint internal simpleInt;
    
    function setInteger(uint _value) external {
        simpleInt = _value;
    }
}

contract ChildContract is ParentContract {
    bool private simpleBool;
    
    function getInteger() public view returns(uint){
        return simpleInt;
    }
}

contract Client {
    ChildContract pc = new ChildContract();
    
    function workWithINheritance() public returns(uint) {
        pc.setInteger(100);
        return pc.getInteger();
    }
}