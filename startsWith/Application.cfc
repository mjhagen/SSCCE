component {
  this.name = "sscce-startsWith";
  function onRequest(string targetPage) {
    testString = "testString";

    writeOutput( "<br />lower:" & testString.startsWith( "test" ) );
    writeOutput( "<br />title:" & testString.startsWith( "Test" ) );
  }
}