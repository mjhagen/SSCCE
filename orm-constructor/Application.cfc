component {
  this.name = "orm-constructor";
  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "nuke.sql",
    flushAtRequestEnd = false,
    autoManageSession = false
  };

  function onApplicationStart( ) {
    ORMReload( );
  }

  function onRequest( ) {
    if ( structKeyExists( url, "reload" ) ) {
      onApplicationStart( );
      location( "./" );
    }

    var foo = entityNew( "foo", { "test" = "test" } );

    writeDump( foo );
  }
}