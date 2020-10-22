// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract FunctionVisibilityDemo {
    
    function thisIsAPublicFn() public {
        this.thisIsAnExternalFn();
        _thisIsAPrivateFn();
        _thisIsAInternalFn();
    }
    
    function _thisIsAPrivateFn() private {
        
    }
    
    function _thisIsAInternalFn() internal {
        
    }
    
    function thisIsAnExternalFn() external {
        
    }
}