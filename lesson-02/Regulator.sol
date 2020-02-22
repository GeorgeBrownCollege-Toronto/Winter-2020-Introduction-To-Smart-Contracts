pragma solidity ^0.5.16;

interface Regulator {
    function checkValue(uint amount) external returns(bool);
    function loan() external returns (bool);
}