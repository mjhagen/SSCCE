component persistent=true {
  property id;
  property name;
  property name="bars" singularname="bar" fieldtype="one-to-many" fkcolumn="fooid" cfc="bar" where="deleted='f'";
  property name="bazs" singularname="baz" fieldtype="one-to-many" fkcolumn="fooid" cfc="baz" where="deleted='f'" lazy=false;
}