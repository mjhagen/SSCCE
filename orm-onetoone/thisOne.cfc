component extends="basecfc.base" persistent=true {
  property name;
  property boolean deleted;
  property numeric sortorder;

  property name="thatOne" fieldtype="one-to-one" cfc="thatOne" mappedby="thisOne";
}