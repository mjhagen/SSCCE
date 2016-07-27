component {
  this.name="sscce-currentdate";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    logSQL = true,
    autoManageSession = false
  };

  function onRequest() {
    ORMReload();

    transaction {
      var allAs = entityLoad( "a" );

      for( a in allAs ) {
        a.setName( "changed" );
      }
    }

    transaction {
      var newA = entityNew( "a" );
      var newID = randRange( 1000, 9999 );
      newA.setID( newID );
      entitySave( newA );
      newA.setName( "It's an A" );
    }

    var allAs = entityLoad( "a" );

    writeDump( allAs );
  }
}