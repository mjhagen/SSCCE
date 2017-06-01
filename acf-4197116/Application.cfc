component {
  this.name = "sscce-setlocale";

  function onRequest( ) {
    var version = replace( createUUID( ), '-', '_', 'all' );

    for ( var i = 1; i <= 5; i++ ) {
      thread name="thread_#version#_#i#" version=version i=i {
        try {
          setLocale( "nl_NL" );
          writeLog( text = "#listLast( version, "_" )# - #i#. success: " & lsNumberFormat( 13.37, ",.00" ), file = "sscce" );
        } catch ( any e ) {
          writeLog( text = "#listLast( version, "_" )# - #i#. failed: " & e.StackTrace, file = "sscce" );
        }
      }
    }
  }
}