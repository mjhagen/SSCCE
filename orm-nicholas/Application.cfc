component {
  this.name="sscce-ormnicholas";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "update",
    saveMapping = true
  };

  function onRequest() {
    ormReload();

    transaction {
      one = entityLoadByPK( 'alchemy_component', '09FD0B4E-5974-4072-BA66-DC0BB2D44107');
      two = entityLoadByPK( 'alchemy_connector', '6F8FD6C3-E23F-4F16-AC2A-ED5A787281C5' );

      two.setComponent( one );
      entitySave( two );
      writeDump( two );

      one.addEffects( two );
      entitySave( one );
      writeDump( one );
    }
  }
}