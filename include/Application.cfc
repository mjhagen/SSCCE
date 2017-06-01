component {
  this.name = "sscce-include";
  this.mappings[ "/foo" ] = expandPath( "./sub" );

  function onRequest( targetPage ) {
    include "/foo/test.cfm";
    include "sub/test.cfm";
    try {
      include "/sub/test.cfm";
    } catch ( any e ) {
      writeOutput( e.message );
    }
  }
}