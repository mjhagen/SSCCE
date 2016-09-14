component {
  this.name = "orm-orderbycase";
  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce-mssql",
    dbCreate = "dropcreate",
    sqlScript = "nuke-mssql.sql",
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

    var foos = ORMExecuteQuery( "FROM foo ORDER BY ( CASE WHEN booleantest = true THEN 1 ELSE 0 END ) DESC" );

    writeDump( foos );
  }
}