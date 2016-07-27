component {
  public function testThings() {
    var scopes = "var ,local.,arguments.,variables.,this.,client.,cookie.,file.,form.,url.";

    for( var scope in scopes ) {
      try {
        var testCode = "#scope#foo='bar'";
        evaluate( testCode );

        writeOutput( "<hr />" & testCode );

        if( isDefined( "foo" )) {
          writeOutput( " <font color='limegreen'>Found!</font>" );
        } else {
          writeOutput( " <font color='silver'>Not found</font>" );
        }
      } catch( any e ) {
        writeOutput( " <font color='red'>error</font>" );
      }

      try {
        evaluate( "structDelete(#scope#,'foo')" );
      } catch ( any e ) {}
    }
  }
}