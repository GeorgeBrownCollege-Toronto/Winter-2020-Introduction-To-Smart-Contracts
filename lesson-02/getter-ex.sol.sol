pragma solidity ^0.5.9;

contract GetterDemo{
    uint public first;
    uint second;
    uint public third;
    
    /* hidden in the code
    function first() public view returns(uint){
        return first;
    }
    */
    
    // function first(uint a) public view returns(uint){
    //     return a + 1;
    // }
    
    function test(uint a) public returns(uint) {
        first = a + 1;
        return first;
    }
}

// contract Second{
//     function get() public returns(uint){
//         GetterDemo g = new GetterDemo();
//         return g.first();
//     }
// }