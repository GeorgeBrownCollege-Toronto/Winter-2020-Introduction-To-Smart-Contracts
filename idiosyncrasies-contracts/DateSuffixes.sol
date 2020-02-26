pragma solidity ^0.5.16;

contract MyContract {
    /**
     * Date suffixes after literal numbers can be used to convert between units of time, 
     * where seconds are the base unit and units are considered naively in the following way:
     */
     
  constructor()public {
    assert(1 == 1 seconds);
    assert(1 minutes == 60 seconds);
    assert(1 hours == 60 minutes);
    assert(1 days == 24 hours);
    assert(1 weeks == 7 days);
    }

  function hasStarted(uint start, uint daysAfter)public view returns (bool) {
    return (now >= start + daysAfter * 1 days);
  }
}

