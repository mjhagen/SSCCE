<cfscript>
  it( "Test case 1 to be 5", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R2, L3" );
    newPuzzle.setExpectedResult( 5 );
    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case 2 to be 2", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R2, R2, R2" );
    newPuzzle.setExpectedResult( 2 );
    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case 3 to be 12", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R5, L5, R5, R3" );
    newPuzzle.setExpectedResult( 12 );
    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case 4 to be 4", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R8, R4, R4, R8" );
    newPuzzle.setExpectedResult( 4 );
    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case 5 to be 111", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setExpectedResult( 111 );
    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  } );
</cfscript>