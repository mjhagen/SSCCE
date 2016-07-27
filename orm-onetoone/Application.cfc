component {
  this.name = "orm-onetoone";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
  };

  function onRequest() {
    ORMReload();

    transaction {
      a = entityNew( "thisOne" );
      a.save({
        name = "a",
        thatOne = {
          name = "b"
        }
      });
      entitySave( a );
    }

    writeDump( entityLoad( "thisOne" ));
  }
}