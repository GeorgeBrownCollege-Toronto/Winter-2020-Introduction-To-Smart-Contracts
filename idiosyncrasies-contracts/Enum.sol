pragma solidity ^0.5.16;

contract MyContract {
  enum MyEnum {
    Foo,
    Bar,
    Qux
  }
  
  /**
   * enum variable type get compiled down to an int8; 
   * (unless the enum has more than 8 options, in which case it walks up the int type scale).
   */

  constructor ()public {
    assert(uint(MyEnum.Foo) == 0);
    assert(uint(MyEnum.Bar) == 1);
    assert(uint(MyEnum.Qux) == 2);
  }
}
