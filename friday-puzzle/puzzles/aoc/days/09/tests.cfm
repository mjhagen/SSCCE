<cfscript>
  // it( "Specific tests for this day - ADVENT", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "ADVENT" );
  //   newPuzzle.setExpectedResult( 6 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  // it( "Specific tests for this day - A(1x5)BC", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "A(1x5)BC" );
  //   newPuzzle.setExpectedResult( 7 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  // it( "Specific tests for this day - (3x3)XYZ", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "(3x3)XYZ" );
  //   newPuzzle.setExpectedResult( 9 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  // it( "Specific tests for this day - A(2x2)BCD(2x2)EFG", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "A(2x2)BCD(2x2)EFG" );
  //   newPuzzle.setExpectedResult( 11 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  // it( "Specific tests for this day - (6x1)(1x3)A", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "(6x1)(1x3)A" );
  //   newPuzzle.setExpectedResult( 6 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  // it( "Specific tests for this day - X(8x2)(3x3)ABCY", function( ) {
  //   var newPuzzle = puzzle.init();

  //   newPuzzle.setTestData( "X(8x2)(3x3)ABCY" );
  //   newPuzzle.setExpectedResult( 18 );

  //   expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  // });

  it( "Specific tests for this day - All tests combined", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( arrayToList( [
      "ADVENT",
      "A(1x5)BC",
      "(3x3)XYZ",
      "A(2x2)BCD(2x2)EFG",
      "(6x1)(1x3)A",
      "X(8x2)(3x3)ABCY"
    ], "" ) );
    newPuzzle.setExpectedResult( 57 );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>