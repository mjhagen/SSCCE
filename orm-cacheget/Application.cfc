component {
  this.name="sscce-cacheget";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    logSQL = true,
    autoManageSession = false
  };

  function onRequest() {
    if( structKeyExists( url, "reload" )) {
      ORMReload();

      transaction {
        var newB = entityNew( "b" );
        newB.setID( 1 );
        entitySave( newB );
        newB.setName( "It's a B" );

        var newA = entityNew( "a" );
        newA.setID( 1 );
        entitySave( newA );
        newA.setName( "It's an A" );

        newA.addB( newB );
        newB.setA( newA );
      }
    }

    ORMCloseSession();

    var cachedA = cacheGet( "a" );

    if( isNull( cachedA ) || structKeyExists( url, "reload" )) {
      transaction {
        var cachedA = entityLoad( "a" );
      }
      cachePut( "a", cachedA );
      writeOutput( "Cache reloaded" );
    }

    writeDump( cachedA );
  }
}