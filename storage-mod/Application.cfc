component {
  this.name = "sscce-storage-mod";

  function onRequest() {
    b = new bar();

    writeOutput( "<br />Test 1: " );

    try {
      writeOutput( b.baz());
    } catch ( any e ) {
      writeOutput( e.message );
    }

    writeOutput( "<br />Test 2: " );

    try {
      writeOutput( evaluate( "b.baz()" ));
    } catch ( any e ) {
      writeOutput( e.message );
    }

  }
}