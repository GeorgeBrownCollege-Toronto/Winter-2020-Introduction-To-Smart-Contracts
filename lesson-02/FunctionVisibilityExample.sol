// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

interface IContract1 {
    function someFunction() external returns(bool);
}

contract Contract1 {
    function A(uint _a) public pure returns(uint) {
        return _a;
    } 
    
    function B(uint _b) internal pure returns(uint) {
        return _b;
    }
    
    function C(uint _c) external pure returns(uint) { // calldata , external
        return _c;
    }
}


contract Contract2 {
   function callPublicFnA() public returns(uint){
       Contract1 c1 = new Contract1();
       uint result = c1.A(2);
       return result;
   } 
   
//   function callInternalFnB() public pure returns(uint) {
//       uint result = B(2);
//       return result;
//   }
   
   function callExternalFnC() public returns(uint) {
       Contract1 c1 = new Contract1();
       uint result = c1.C(2);
       return result;
   }
}