<cfscript>
  //


  // an array of files in this directory (including their full path)
  arrayOfTempFiles = directoryList( './', false, "path", "*.*" );

  //
  queryOfFiles = directoryList( expandPath( './' ), false, "query", "", "DateLastModified DESC" );
</cfscript>

<cfdump var="#variables#">