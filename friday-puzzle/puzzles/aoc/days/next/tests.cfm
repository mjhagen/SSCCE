<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "dummy-input" );
    newPuzzle.setExpectedResult( "dummy-output" );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>