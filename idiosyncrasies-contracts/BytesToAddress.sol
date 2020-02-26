pragma solidity ^0.5.16;

contract MyContract {
    /**
     * Can't easily convert bytes to address: need to manually convert each byte to uint160:
     */
     
  function bytesToAddress(bytes memory _address) public pure returns (address) {
    uint160 m = 0;
    uint160 b = 0;

    for (uint8 i = 0; i < 20; i++) {
      m *= 256;
      b = uint160(uint8(_address[i]));
      m += (b);
    }

    return address(m);
  }
}
