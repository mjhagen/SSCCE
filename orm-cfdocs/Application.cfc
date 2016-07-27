component {
  this.name = "orm-cfdocs";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    // sqlScript = "sqlScript.sql",
    CFCLocation = "./model",
    flushAtRequestEnd = false
  };

  function onRequest() {
    ORMReload();

    var myFoo = entityNew( "foo" );
    myFoo.setID( 1 );
    myFoo.setName( "Foo!" );
    entitySave( myFoo );
  }
}