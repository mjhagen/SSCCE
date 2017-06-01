<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "abc" );
    newPuzzle.setExpectedResult( "18f47a30" );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Specific tests for this day Part Two", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setExpectedResult( "f2c730e5" );
    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>