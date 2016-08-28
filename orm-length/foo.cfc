component persistent=true {
  property id;
  property name="name" length="5";
  property name="bars" singularname="bar" fieldtype="one-to-many" fkcolumn="fooid" cfc="bar";
}