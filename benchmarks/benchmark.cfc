component {
  resetTimers( );

  function start( timer = createUUID() ) {
    var timeNow = getTickCount( );
    variables.currentTimer = {
      name = timer,
      time = timeNow
    };
  }

  function stop( ) {
    var timeNow = getTickCount( );

    if ( !structKeyExists( variables, "currentTimer" ) ) {
      throw( "Missing .start() statement." );
    }

    if ( !structKeyExists( variables.timers, variables.currentTimer.name ) ) {
      variables.timers[ variables.currentTimer.name ] = [ ];
    }

    arrayAppend( variables.timers[ variables.currentTimer.name ], timeNow - variables.currentTimer.time );

    structDelete( variables, "currentTimer" );
  }

  function output( ) {
    for ( var key in timers ) {
      writeOutput( "#key#: #arrayAvg( timers[ key ] )#<br />" );
    }

    resetTimers( );
  }

  private function resetTimers( ) {
    variables.timers = {};
  }
}