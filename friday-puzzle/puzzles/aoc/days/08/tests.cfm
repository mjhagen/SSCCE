<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setGridSize( [ 3, 7 ] );
    newPuzzle.setTestData( "rect 3x2
rotate column x=1 by 1
rotate row y=0 by 4
rotate column x=1 by 1" );
    newPuzzle.setExpectedResult( 6 );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>