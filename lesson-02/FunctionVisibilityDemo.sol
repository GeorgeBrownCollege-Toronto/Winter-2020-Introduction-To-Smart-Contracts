// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract FunctionVisibilityDemo {
    // public
    function thisIsAPublicFn() public {
        // body
        this.thisIsExternalFn();
        _thisIsAPrivateFn();
        _thisIsInternalFn();
    }
    
    // private
    function _thisIsAPrivateFn() private {
        // body
    }
    
    // internal
    function _thisIsInternalFn() internal {
        // body
    }
    
    // external
    function thisIsExternalFn() external {
        // body
        thisIsAPublicFn();
    }
    
    // // function syntax
    // function function_name(<arg-data-type> <arg-data-location> <arg-name>,...,) <visibility-specifier public|private|internal|external> <state-mutability view|pure|payable> [returns(<return-data-type> [return-arg-name])] {
    //     // function body
    // }
}
