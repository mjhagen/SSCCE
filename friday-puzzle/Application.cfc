component {
  this.name = "sscce-friday-puzzle";
  this.passArrayByReference = false;
  this.rootDir = getDirectoryFromPath( getCurrentTemplatePath() );
  this.mappings[ "/cfroot" ] = this.rootDir;

  public function onRequest( string path ) {
    var puzzleDir = listLast( getDirectoryFromPath( path ), '/' );

    if( fileExists( "#this.rootDir#/#puzzleDir#/app/puzzle.cfc" ) ) {
      var puzzle = createObject( "#puzzleDir#.app.puzzle" );

      if ( structKeyExists( puzzle, "init" ) ) {
        puzzle.init();
      }

      request.puzzle = puzzle;
    }

    url.directory="/sscce/friday-puzzle/#puzzleDir#";
    url.recurse=false;

    include "/testbox/system/runners/HTMLRunner.cfm";
  }
}