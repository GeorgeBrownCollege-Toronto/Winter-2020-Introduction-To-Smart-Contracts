pragma solidity ^0.5.9;

contract structDemo{
    struct Person{
        uint8 age;
        string name;
    }
    
    Person p;
    
    function setPerson(uint8 _age, string memory name) public returns(bool){
        Person memory pr = Person(_age,name);
        p = pr;
    }
    
    function getPersonAge() public view returns(uint8){
        return p.age;
    }
}