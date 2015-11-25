component {
  this.name="sscce-temp";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    saveMapping = true
  };

  function onRequest() {
    ormReload();

    transaction {
      var t = new third();
      t.setID( createUuid());
      t.setThird( "test" );
      entitySave( t );
    }
  }
}