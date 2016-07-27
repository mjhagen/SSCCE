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

    var foos = entityLoad( "foo" );

transaction {
  try {
    foos[1].setLengthTest( "too long" );
    transactionCommit();
  } catch ( any e ) {
    transactionRollback();
    writeOutput( "rolled back because: #e.detail#" );
  }
}

    writeDump(foos);
  }
}