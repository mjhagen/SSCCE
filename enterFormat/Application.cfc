component {
  public string function enterFormat( required string source ) {
    return reReplace( source, '\n', '<br />', 'all' );
  }

  function onRequest() {
    writeOutput( enterFormat( 'test
1

2

3
' ) );
  }
}