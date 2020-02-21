pragma solidity ^0.5.9; // between 0.5.9 and 0.6.0


contract myFirstContract{
    uint public age;
    string public name;
    
    function setAge(uint _age) public {
        age = _age;
    }
    
    function setName(string memory _name) public{
        name = _name;
    }
}