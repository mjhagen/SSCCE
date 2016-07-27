component persistent=true {
  property id;
  property name;
  property name="data" type="string" sqlType="jsonb";
  property name="foos" singularName="foo" cfc="foo" fieldtype="one-to-many" fkColumn="testtableid";
}