pragma solidity ^0.5.9;

contract FnOverloadingDemo{
    
    function f(uint a) public pure returns(uint) {
        return a+1;
    }
    
    function f(int a) public pure returns(int) {
        return a+1;
    }
    
    function f(int a,int b) public pure returns(int) {
        return a+b;
    }
}

contract D {
    
    function test() public {
        FnOverloadingDemo fn = new FnOverloadingDemo();
        fn.f(10,10);
    }
}