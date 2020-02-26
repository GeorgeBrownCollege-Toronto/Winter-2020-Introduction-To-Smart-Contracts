pragma solidity ^0.5.16;

contract DynArray {
    uint8[] public arr;
    
    constructor() public {
        arr = new uint8[](0);
    }
    
    function getArray()public view returns (uint8[] memory) {
        return arr;
    }
    
    function getNumItems() public view returns (uint256) {
        return arr.length;
    }
    
    function addTo(uint8 v) 
        public 
    {
        arr.push(v);
    }
}