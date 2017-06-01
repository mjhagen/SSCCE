component {
  this.name = "orm-transactions";
  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "nuke.sql",
    flushAtRequestEnd = false,
    autoManageSession=false
  };

  function onApplicationStart() {
    ORMReload();
  }

  function onRequest() {
    if( structKeyExists( url, "reload" )) {
      onApplicationStart();
      location( "./" );
    }

    writeDump( ORMExecuteQuery( "SELECT MAX( position ) FROM foo", {} ) );
  }
}