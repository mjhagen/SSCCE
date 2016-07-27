component {
  this.name = "orm-has1";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "sqlScript.sql"
  };

  function onRequest() {
    ORMReload();

    var myFoo = entityLoadByPK( "foo", 1 );

    writeOutput( "hasBar() using lazy=true<br />" );
    writeDump( myFoo.hasBar());
    writeDump( myFoo.getBars());

    writeOutput( "hasBaz() using lazy=false<br />" );
    writeDump( myFoo.hasBaz());
    writeDump( myFoo.getBazs());
  }
}