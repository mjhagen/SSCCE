component extends="basecfc.base" persistent=true {
  property name;
  property boolean deleted;
  property numeric sortorder;

  property name="id" fieldtype="id" generator="foreign" params="{property='thisOne'}" ormtype="string" length="65";
  property name="thisOne" fieldtype="one-to-one" cfc="thisOne" fkcolumn="thisid";
}