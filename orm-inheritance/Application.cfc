component {
  this.name = "sscce-inheritance";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
    // , saveMapping = true
  };

  function onRequest( ) {
    ormReload( );

    transaction {
      var marine = entityNew( "xx" );
      // marine.save();
    }
  }
}