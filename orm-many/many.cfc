component persistent=true {
  property name="id" type="int" generator="increment";
  property name="more" singularname="more" fieldtype="many-to-many" cfc="many" fkcolumn="manyid" inverseJoinColumn="moreid" inverse=true;
  property name="many" singularname="many" fieldtype="many-to-many" cfc="many" fkcolumn="moreid" inverseJoinColumn="manyid";
}