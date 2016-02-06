component {
  this.name="sscce-many";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
    // , saveMapping = true
  };

  function onRequest() {
    ormReload();

    many = entityNew( "many" );
    more = entityNew( "many" );

    many.addMore( more );
    more.addMany( many );

    entitySave( many );
    entitySave( more );
  }
}