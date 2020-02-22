pragma solidity ^0.5.16;

contract Calculator{
    
    function add(uint _a, uint _b) public pure returns(uint ,uint){
        uint sum;
        uint product;
        sum = _a + _b;
        product = _a * _b;
        
        return(sum,product);
    }
    
    
    // function add(uint _a, uint _b, uint _c) public pure returns(uint ,uint){
    //     uint sum;
    //     uint product;
    //     sum = _a + _b + _c;
    //     product = _a * _b * _c;
        
    //     return(sum,product);
    // }
    
    
    
    // function add(uint _a , uint _b) public pure returns(uint) {
    //     uint sum = _a + _b;
    //     return sum;
    // }
}