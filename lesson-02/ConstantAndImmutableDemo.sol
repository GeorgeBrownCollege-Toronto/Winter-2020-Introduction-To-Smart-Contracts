// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract ConstantAndImmutableDemo {
    // this is a single line comment
    /*
    This is a multiline comment
    Line 1
    Line 2
    */
    // native tyoe
    uint constant number1 = 90;
    uint immutable number2;
    address constant userId = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bool constant isCreated = true; // true or false
    bytes32 constant nameHash = keccak256("GBC");
    enum Enum_Name { first, second, third }
    Enum_Name constant enum_var_name = Enum_Name.first;
    
    // reference types
    string constant name = "GBC";
    // array
    // mapping
    // struct
    
    struct Struct_Name {
        uint a1;
    }
    
    constructor (uint _number2) {
        number2 = _number2;
    }
}