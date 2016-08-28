component {
  this.name = "orm-sqltype";
  this.datasource = "sscce";
  this.ormEnabled = true;
  this.ormSettings.dbcreate = "dropcreate";
  // this.ormSettings.saveMapping = true;

  function onRequest() {
    ormreload();

    myFoo = entityLoad( "foo" );
    writeDump( myFoo );
  }
}