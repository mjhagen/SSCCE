component persistent=true {
  property id;
  property name;
  property name="foo" fieldtype="many-to-one" fkcolumn="fooid" cfc="foo" lazy=true;
}