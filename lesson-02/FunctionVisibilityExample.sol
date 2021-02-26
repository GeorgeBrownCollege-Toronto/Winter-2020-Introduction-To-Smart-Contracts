// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

interface IContract1 {
    function A(uint _a) external pure returns(uint);
    function C(uint _a) external pure returns(uint);
}

contract Contract1 {
    function A(uint _a) public pure returns(uint) {
        return _a;
    }
    
    function _B(uint _a) internal pure returns(uint) {
        return _a;
    }
    
    function C(uint _a) external pure returns(uint) {
        return _a;
    }
}

contract Contract2 is Contract1 {
    IContract1 public contract_1;
    
    constructor(address  _contract1) {
        contract_1 = IContract1(_contract1);
    }
    
    function callPublicFnA() public view returns(uint) {
        uint result = contract_1.A(2);
        return result;
    }
    
    function callExternalFnC() public view returns(uint) {
        uint result = contract_1.C(2);
        return result;
    }
    
    function callInternalFnB() public pure returns(uint) {
        uint result = _B(4);
        return result;
    }
}