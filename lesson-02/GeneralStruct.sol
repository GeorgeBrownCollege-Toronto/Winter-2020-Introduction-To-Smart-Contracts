// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;
pragma experimental ABIEncoderV2;

contract GeneralStruct {
    struct myStruct {
        uint8 age;
        string name;
        address[] accounts;
     }
     
     mapping(address => myStruct) myMapping; // storage
     
     function setMyStruct(uint8 _age, string memory _name, address[] memory _accounts) public {
         myMapping[msg.sender].name = _name;
         myMapping[msg.sender].age = _age;
        
        for (uint8 _i = 0 ; _i < uint8(_accounts.length); _i++) {
            myMapping[msg.sender].accounts.push(_accounts[_i]);
        }   
     }
     
     function setMyStruct(myStruct memory _myStruct) public {
         myMapping[msg.sender] = _myStruct;   
     }
     
     function getMyMapping(address _personIdentifier) public view returns(uint8, string memory, address[] memory) {
         string memory _name = myMapping[_personIdentifier].name;
         uint8 _age = myMapping[_personIdentifier].age;
         address[] memory _accounts = myMapping[_personIdentifier].accounts;
         return (_age,_name,_accounts);
     }
     
     function getMyActualStruct(address _personIdentifier) public view returns(myStruct memory _myStruct) {
         _myStruct = myMapping[_personIdentifier];   
     }
     
}