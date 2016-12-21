<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "abc" );
    newPuzzle.setExpectedResult( "18f47a30" );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>