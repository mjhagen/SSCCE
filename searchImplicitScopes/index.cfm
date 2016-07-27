<!--- <cfset obj = new anObject() />

<cfset obj.testThings() />

 --->

<cfscript>
    scopes = "local.,arguments.,variables.,this.,client.,cookie.,file.,form.,url.";

    for( scope in scopes ) {
      try {
        testCode = "#scope#foo='bar'";
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
</cfscript>