component {
  resetTimers( );

  function init( ) {
    variables.system = createObject( "java", "java.lang.System" );

    return this;
  }

  function start( timer = createUUID() ) {
    stop( );
    variables.currentTimer = {
      name = timer,
      time = variables.system.nanoTime( )
    };
  }

  function stop( ) {
    var timeNow = variables.system.nanoTime( );

    if ( !structKeyExists( variables, "currentTimer" ) ) {
      return;
    }

    var timerName = variables.currentTimer.name;

    if ( !structKeyExists( variables.timers, timerName ) ) {
      variables.timers[ timerName ] = [ ];
    }

    arrayAppend( variables.timers[ timerName ], timeNow - variables.currentTimer.time );

    structDelete( variables, "currentTimer" );
  }

  function output( ) {
    writeOutput( '<table>' );

    for ( var key in timers ) {
      writeOutput( '<tr><td>#key#:</td><td>#numberFormat( arrayAvg( timers[ key ] ) / 1000, ',.00000' )#</td></tr>' );
    }

    writeOutput( '<table>' );

    writeOutput( outputServerInfo( ) );

    resetTimers( );
  }

  private function resetTimers( ) {
    variables.timers = structNew( "ordered" );
  }

  private function outputServerInfo( ) {
    var result = "CF Server: " & server.coldfusion.productName;

    if ( structKeyExists( server, "lucee" ) ) {
      result &= " " & server.lucee.version;
    } else {
      result &= " " & server.coldfusion.productVersion;
    }

    var javaLangSystem = createObject( "java", "java.lang.System" );

    result &= "<br>Java Version: #javaLangSystem.getProperty( 'java.version' )#";

    return result;
  }
}