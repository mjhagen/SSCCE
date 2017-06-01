component {
  this.name = "sscce-uniqueFilename";

  function onRequest( string targetPage ) {
    writeOutput( makeUnique( "C:\TEMP\fts_2.bak" ) );
  }

  function makeUnique( string path ) {
    var filePart = getFileFromPath( path );

    if( !fileExists( path ) ) {
      return filePart;
    }

    var dirPart = getDirectoryFromPath( path );
    var fileParts = reFind( "(.*)\.(.*)", filePart, 1, true );

    var fileNamePart = mid( filePart, fileParts.pos[ 2 ], fileParts.len[ 2 ] );
    var extensionPart = mid( filePart, fileParts.pos[ 3 ], fileParts.len[ 3 ] );
    var counter = 0;

    do {
      counter++;
      var testFilename = fileNamePart & "-" & counter & "." & extensionPart;
    } while ( fileExists( dirPart & "/" & testFilename ) );

    return testFilename;
  }
}