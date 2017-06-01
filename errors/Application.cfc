component {
  this.name = "sscce-errors";

  function onRequest( ) {
    var jRuntimeException = createObject( "java", "java.lang.RuntimeException" ).init( "Hello World" );
    var cfError = new Error();

    throw( object = jRuntimeException );
  }

  function onError( ) {
    writeDump( arguments[ 1 ] );
  }
}