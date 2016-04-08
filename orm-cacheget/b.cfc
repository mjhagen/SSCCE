component persistent=true {
  property id;
  property name;
  property name="a" fieldtype="many-to-one" cfc="a" fkcolumn="aid";
}