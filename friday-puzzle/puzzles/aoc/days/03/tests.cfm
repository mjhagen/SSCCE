<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "5 10 25" );
    newPuzzle.setExpectedResult( 0 );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Expects test 2 to be 6", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "101 301 501
102 302 502
103 303 503
201 401 601
202 402 602
203 403 603" );
    newPuzzle.setExpectedResult( 6 );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Expects Part 2 to be correct", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setExpectedResult( 1544 );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>