component extends=testbox.system.BaseSpec {
  public void function run( ) {
    var allDays = directoryList( expandPath( "/cfroot/puzzles/aoc/days/" ), false, "name", "", "Directory", "dir" );

    if ( structKeyExists( url, "day" ) ) {
      allDays = numberformat( url.day, "00" );
    }

    for ( var dayNr in allDays ) {
      if ( !isNumeric( dayNr ) ) {
        continue;
      }

      describe( "AoC Day #dayNr# tests", function( ) {
        var puzzle = createObject( "cfroot.puzzles.aoc.days.#dayNr#.puzzle" ).init( );

        include "/cfroot/puzzles/aoc/days/#dayNr#/tests.cfm";

        it( "Expects puzzle to match expected result", function( ) {
          puzzle.init();
          var expectedResult = puzzle.getExpectedResult( );
          var solution = puzzle.solve( );

          expect( solution ).toBe( expectedResult );
        } );
      } );
    }
  }
}