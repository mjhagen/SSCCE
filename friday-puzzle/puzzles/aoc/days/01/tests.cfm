<cfscript>
  it( "Test case 1 to be 5", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R2, L3" );
    newPuzzle.setExpectedResult( 5 );
    expect( newPuzzle.solve( ) ).toBe( 5 );
  } );

  it( "Test case 2 to be 2", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R2, R2, R2" );
    newPuzzle.setExpectedResult( 2 );
    expect( newPuzzle.solve( ) ).toBe( 2 );
  } );

  it( "Test case 3 to be 12", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "R5, L5, R5, R3" );
    newPuzzle.setExpectedResult( 12 );
    expect( newPuzzle.solve( ) ).toBe( 12 );
  } );
</cfscript>