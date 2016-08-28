component {
  this.name = "orm-has1";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "sqlScript.sql",
    logSQL=true,
    saveMapping = true
  };

  function onRequest() {
    ORMReload();
    var myFoo = entityNew( "foo" );
    myFoo.setName( "mingoj" );
    myFoo.setId( 1 );
    entitySave( myFoo );
  }
}