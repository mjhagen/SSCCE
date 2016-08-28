component {
  this.name = "sscce-friday-puzzle";
  this.rootDir = getDirectoryFromPath( getCurrentTemplatePath() );
  this.mappings[ "/cfroot" ] = this.rootDir;

  public function onRequest( string path ) {
    var puzzleDir = listLast( getDirectoryFromPath( path ), '/' );

    if( isNumeric( puzzleDir )) {
      if( fileExists( "#this.rootDir#/puzzles/#puzzleDir#/app/puzzle.cfc" ) ) {
        request.puzzle = createObject( "cfroot.puzzles.#puzzleDir#.app.puzzle" ).init();
      }

      url.directory="/sscce/friday-puzzle/puzzles/#puzzleDir#";
      url.recurse=false;

      include "/testbox/system/runners/HTMLRunner.cfm";
    } else {
      var puzzles = directoryList( expandPath( "/cfroot/puzzles" ), "false", "name" );
      include "/cfroot/views/list-puzzles.cfm";
    }
  }
}