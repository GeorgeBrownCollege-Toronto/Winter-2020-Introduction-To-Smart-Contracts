// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

interface IHelloWorld {
    function getValue() external view returns(uint);
    function setValue(uint) external;
}

contract HelloWorld is IHelloWorld{
    uint private simpleInt;
    
    function getValue() public view override returns(uint) {
        return simpleInt;
    }
    
    function setValue(uint _v) public override {
        simpleInt = _v;
    }
}

contract Client {
    IHelloWorld myObj;
    
    constructor() {
        myObj = new HelloWorld();
    }
    
    function  getAndSetIntegerValue() public returns(uint) {
        myObj.setValue(100);
        return myObj.getValue();
    }
}