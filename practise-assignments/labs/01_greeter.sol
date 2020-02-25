/*
	Write a smart contract that takes a string upon creation and 
    then repeats it when greet() is called.
*/

pragma solidity ^0.5.16;

/// @title Greeter
// The contract definition. A constructor of the same name will be automatically called on contract creation.
contract Greeter {

    // Declare an empty "address"-type variable of the name "creator". Will be set in the constructor.

    // Declare an empty "string"-type variable of the name "greeting". Will be set in constructor and can be changed.

    // The constructor. It accepts a string input and saves it to the contract's "greeting" variable.
    function constuctor() public {
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    // this doesn't have anything to do with the act of greeting
    // Declare a function demonstrating return of some global variable

    function setGreeting(string memory _newgreeting) public {
        greeting = _newgreeting;
    }

     /**********
     Standard kill() function to recover funds
     **********/

    function kill() public payable {
        if (msg.sender == creator)
            // use selfdestruct() to kills the contract and sends remaining funds back to creator
    }
}