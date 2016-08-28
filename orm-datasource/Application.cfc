component {
  this.name="sscce-datatype";

  this.datasource = javaCast( "null", 0 );

  this.ormEnabled = true;
  this.ormSettings = {
    dbCreate = "dropcreate"
  };

  function onRequestStart() {
    this.datasource = "sscce";

    ORMReload();
  }
}