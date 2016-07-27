component accessors=true extends=bar {
  property id;
  property name;
  property name="testtable" cfc="testtable" fieldtype="many-to-one" inverse="true" fkColumn="testtableid";

  function init() {

    abort;
  }
}