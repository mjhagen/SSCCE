component {
  this.name = getDirectoryFromPath(expandPath('./'));
  this.datasource = "sscce";
  this.ormEnabled = true;
  this.ormSettings.dbcreate = "dropcreate";
  this.ormSettings.saveMapping = true;

  function onRequest() {
    ormreload();

    transaction {
      var second = entityNew( "second" );
          second.setFoo( "bar" );
          second.setAdobeSucks( true );

      writeOutput( serializeJSON( second ) & "<br />" );
      entitySave( second );
    }

    writeOutput( serializeJSON( second ) & "<br />");

    transaction {
      testit = entityLoad( "second" );
      writeOutput( serializeJSON( testit ) & "<br />");
    }
  }
}