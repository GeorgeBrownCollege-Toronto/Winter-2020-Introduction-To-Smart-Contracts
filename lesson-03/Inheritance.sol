// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Parent {
    uint internal simpleInt;
    
    function setInteger(uint _value) external {
        simpleInt = _value;
    }
    
}

contract Child is Parent {
    function getInteger() public view returns(uint) {
        return simpleInt;
    }
}

contract Client {
    Child _child = new Child();
    
    function set(uint _val) public {
        _child.setInteger(_val);
    }
    
    function get() public view returns(uint) {
        return _child.getInteger();
    }
    
    function getChild() public view returns(address) {
        return address(_child);
    }
}