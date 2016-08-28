component {
  this.name = "sscce-ormnicholas";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "update",
    saveMapping = true,
    autoManageSession = false,
    flushAtRequestEnd = false
  };

  function onRequestStart( ) {
    ormReload( );

    transaction {
      var sub = entityNew( 'Squirrel-piss' );
    }
    writeDump( sub );


    // transaction {
    //   writeDump( ORMExecuteQuery( "
    //     SELECT    component.id,
    //               effect.id

    //     FROM      alchemy_connector connector
    //               JOIN connector.component component
    //               JOIN component.effects effect
    //   " ));
    // }
  }
}