/*  Write a contract that increments value.
    Include a function increment() that takes no parameters and 
    merely increments the "iteration" value. 
*/

pragma solidity ^0.5.16;

contract Incrementer {

    address creator;
    uint iteration;

    constructor () public 
    {
        creator = msg.sender; 
        iteration = 0;
    }

    function increment() public
    {
        // write an expression that increments `iteration` by one
        // handle integer overflow condition.
    }
    
    // declare a getter function getIteration() to read value of iteration
}