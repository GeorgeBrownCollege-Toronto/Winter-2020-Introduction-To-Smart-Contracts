pragma solidity ^0.5.16;

contract Getter{
    
    uint public _val;
    
        constructor() public {
        _val = 100;
    }
    
    function setVal(uint val) public {
        _val = val;
    }
    
    function getVal() public view returns(uint){
        return this._val();
    }
} 

// contract getter2 is Getter{
//     Getter g = new Getter();
//     function test() public view returns(uint)  {
//         return g._val();
//     }
// }