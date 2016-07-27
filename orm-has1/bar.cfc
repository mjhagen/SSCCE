component persistent=true {
  property id;
  property name;
  property boolean deleted;
  property name="foo" fieldtype="many-to-one" fkcolumn="fooid" cfc="foo";
}