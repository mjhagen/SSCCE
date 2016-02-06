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
      writeDump( ORMExecuteQuery( "
        SELECT    component.id,
                  effect.id

        FROM      alchemy_connector connector
                  JOIN connector.component component
                  JOIN component.effects effect
      " ));
    }
  }
}