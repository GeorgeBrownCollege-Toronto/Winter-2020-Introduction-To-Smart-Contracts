pragma solidity ^0.5.16;

/**
 * external: function is part of the contract interface, which means it can be called from other contracts and via transactions. 
 * External functions are sometimes more efficient when they receive large arrays of data. 
 * Use external if you expect that the function will only ever be called externally. For external functions, 
 * the compiler doesn't need to allow internal calls, and so it allows arguments to be read directly from calldata, 
 * saving the copying step, which will save more gas. Also note that external functions cannot be inherited by other contracts!
 * 
 * public: function can either be called internally or externally. 
 * For public state variables, an automatic getter function is generated.
*/

contract MyContract {
  function publicCalculate(uint[20] memory a) public pure returns (uint){
       return a[10]*2;
  }

  function externalCalcuate(uint[20] calldata a) external pure returns (uint){
       return a[10]*2;
  }
}
