component {
  this.name = "orm-has1";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "sqlScript.sql",
    logSQL=true
  };

  function onRequest() {
    ORMReload();

    var myFoo = entityLoadByPK( "bar", 1 );
  }
}