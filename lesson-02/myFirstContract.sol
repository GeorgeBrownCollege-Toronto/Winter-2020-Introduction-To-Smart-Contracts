pragma solidity ^0.5.16; // between 0.5.9 and 0.6.0

import "./Bank.sol";

contract myFirstContract is Bank(10){
    // uint public age;
    // string public name;
    
    struct User {
        uint age;
        string name;
    }
    
    User u;
    
    // function setAge(uint _age) public {
    //     age = _age;
    // }
    
    // function setName(string memory _name) public{
    //     name = _name;
    // }
    
    function getBlockNum() public view returns(uint){
        return block.number;
    }
    
    function setUser(uint _age, string memory _name) public {
        u = User(_age, _name);
    }
    
    function getAge() public view returns(uint) {
        return u.age;
    }
    
     function getName() public view returns(string memory) {
        return u.name;
    }
}