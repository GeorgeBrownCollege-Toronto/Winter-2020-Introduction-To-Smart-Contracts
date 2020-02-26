pragma solidity ^0.5.16;

contract MyContract {
    string[] strings;

    constructor () public {
        strings.push("hi");
        strings.push("bye");
    }

    function bar()public view returns(string memory) {
        return strings[1];
    }
}