component persistent=true {
  property id;
  property name;
  property name="bars" singularname="bar" fieldtype="one-to-many" fkcolumn="fooid" cfc="bar";
}