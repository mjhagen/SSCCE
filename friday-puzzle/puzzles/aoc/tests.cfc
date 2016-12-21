component extends=testbox.system.BaseSpec {
  param url.day=1;
  variables.dayNr = numberFormat( url.day, "00" );

  public void function run( ) {
    describe( "aoc tests", function( ) {
      var testsFile = "/cfroot/puzzles/aoc/days/#dayNr#/tests.cfm";

      if( fileExists( expandPath( testsFile ) ) ) {
        beforeEach( function() {
          puzzle = createObject( "cfroot.puzzles.aoc.days.#dayNr#.puzzle" ).init( );
        } );

        include testsFile;

        it( title = "Expects puzzle to match expected result", body = function( ) {
          var expectedResult = puzzle.getExpectedResult( );
          var solution = puzzle.solve( );
          expect( solution ).toBe( expectedResult );
        } );
      } else {
        it( "Expects puzzle to have tests", function( ) {
          expect( fileExists( expandPath( testsFile ) ) )
            .toBeTrue( "Day #dayNr# doesn't have tests." );
        } );
      }
    } );
  }
}