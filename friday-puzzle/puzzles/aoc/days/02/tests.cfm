<cfscript>
  // it( "Specific tests for this day", function( ) {
  //   var newPuzzle = puzzle.init();

  //   expect( newPuzzle.translateCoordsToDigitMatrix( [ -1,  1 ] ) ).toBe( 1 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  0,  1 ] ) ).toBe( 2 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  1,  1 ] ) ).toBe( 3 );

  //   expect( newPuzzle.translateCoordsToDigitMatrix( [ -1,  0 ] ) ).toBe( 4 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  0,  0 ] ) ).toBe( 5 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  1,  0 ] ) ).toBe( 6 );

  //   expect( newPuzzle.translateCoordsToDigitMatrix( [ -1, -1 ] ) ).toBe( 7 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  0, -1 ] ) ).toBe( 8 );
  //   expect( newPuzzle.translateCoordsToDigitMatrix( [  1, -1 ] ) ).toBe( 9 );
  // });

  it( "Test case 1 to be 1985", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "ULL
RRDDD
LURDL
UUUUD" );
    newPuzzle.setExpectedResult( 1985 );
    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case 2 to be 5DB3", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setTestData( "ULL
RRDDD
LURDL
UUUUD" );
    newPuzzle.setDigitMatrix( [
      [ '0', '0', '1', '0', '0' ],
      [ '0', '2', '3', '4', '0' ],
      [ '5', '6', '7', '8', '9' ],
      [ '0', 'A', 'B', 'C', '0' ],
      [ '0', '0', 'D', '0', '0' ]
    ] );

    newPuzzle.setExpectedResult( '5DB3' );
    var solution = newPuzzle.solve( );
    expect( solution ).toBe( newPuzzle.getExpectedResult() );
  } );

  it( "Test case for Part Two", function( ) {
    var newPuzzle = puzzle.init();
    newPuzzle.setExpectedResult( 'D65C3' );
    var solution = newPuzzle.solvePartTwo( );

    expect( solution ).toBe( newPuzzle.getExpectedResult() );
  } );
</cfscript>