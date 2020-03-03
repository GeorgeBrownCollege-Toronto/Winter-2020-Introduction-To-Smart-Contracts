pragma solidity ^0.5.16;

contract mappingEx{
    
    struct Instructor{
        uint age;
        string name;
    }
    
    mapping(address => Instructor) instructors;
    address[] public instructorArray;
    
    function setInstructor(address _account_id,uint _age, string memory _name) public{
        Instructor storage instructor = instructors[_account_id];
        
        instructor.age = _age;
        instructor.name = _name;
        
        instructorArray.push(_account_id);
    }
    
    function getInstructors() public view returns(address[] memory){
        return instructorArray;
    }
    
    function getInstructorsByAccountId(address _account_id) public view returns(address,uint,string memory) {
        return(_account_id,instructors[_account_id].age,instructors[_account_id].name);
    }
    
    function countOf() public view returns(uint){
        return instructorArray.length;
    }
}