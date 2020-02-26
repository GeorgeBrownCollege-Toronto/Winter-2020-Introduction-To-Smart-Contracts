pragma solidity ^0.5.16;

contract MyContract {
  uint[] array = [1,2,3];
/**
 * Using delete on an array leaves a gap; need to shift items manually and update the length property.
 */
 
  function removeAtIndex(uint index)public returns (uint[] memory) {
    if (index >= array.length) revert();

    for (uint i = index; i < array.length-1; i++) {
      array[i] = array[i+1];
    }

    delete array[array.length-1];
    array.length--;

    return array;
  }
}


