component {
  this.name = "sscce-tojson";
  this.javaSettings.loadPaths = [ "./gson-2.7.jar" ];

  function onRequest( string targetPage ) {
    var gson = createObject( "java", "com.google.gson.GsonBuilder" ).init( )
      .serializeNulls( )
      .setPrettyPrinting( )
      .create( );

    writeOutput( "<pre>#gson.toJson( { "lastname" = "No" } )#</pre>" );
  }
}