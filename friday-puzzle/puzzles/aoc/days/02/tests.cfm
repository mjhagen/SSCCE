<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    expect( newPuzzle.translateCoordsToDigitMatrix( [ -1,  1 ] ) ).toBe( 1 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  0,  1 ] ) ).toBe( 2 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  1,  1 ] ) ).toBe( 3 );

    expect( newPuzzle.translateCoordsToDigitMatrix( [ -1,  0 ] ) ).toBe( 4 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  0,  0 ] ) ).toBe( 5 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  1,  0 ] ) ).toBe( 6 );

    expect( newPuzzle.translateCoordsToDigitMatrix( [ -1, -1 ] ) ).toBe( 7 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  0, -1 ] ) ).toBe( 8 );
    expect( newPuzzle.translateCoordsToDigitMatrix( [  1, -1 ] ) ).toBe( 9 );
  });

  it( "Test case 1 to be 1985", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "ULL
RRDDD
LURDL
UUUUD" );
    newPuzzle.setExpectedResult( 1985 );
    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  } );
</cfscript>