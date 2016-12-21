<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "5 10 25" );
    newPuzzle.setExpectedResult( 0 );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>