pragma solidity ^0.5.16;


contract Counter {
    uint256 count;
    
    function increment()public {
        count = count + 1;
    }
    
    function decrement()public {
        count = count - 1;
    }
    
    function getCount()public view returns(uint){
        return count;
    }
}