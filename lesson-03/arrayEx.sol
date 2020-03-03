pragma solidity ^0.5.16;

contract arryExample{
    
    //declaration of an dynamic length array
    bytes32[] names;
    
    //declaration of fixed length array
    bytes32[4] fNames;
    
    function arrTest() public returns(uint){
        // assigning inline array
        string[4] memory inlineArray = ["sam","mike","peter","mckay"];
        
        // multi dimensional array(2D)
        uint[3][] memory multiArray;
        
        // initializing multi-dimensional array
        multiArray = new uint[3][](2);
        
        multiArray[0][1] = 20;
        
        // multiArray[0].push([1,2,3,4,5]);
        
        // // push member of an array
        // names.push("JON");
        // names.push("PURDY");
        
        // // per index assignment
        // fNames[0] = "Matt";
        // // return names[0];
        // assert (fNames.length == 4);
        // assert(names.length == 2);
        
        return multiArray[0][1];
        
    }
}