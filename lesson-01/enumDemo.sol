pragma solidity ^0.5.9;

contract enumDemo{
    
    enum DrivingInstruction { GoLeft, GoRight, GoStraight, StandStill }
    
    DrivingInstruction instruction;
    
    function setGoRight()  public {
        instruction = DrivingInstruction.GoRight;
    }
    
    function getInstruction() public view returns(DrivingInstruction){
        return instruction;
    }
}