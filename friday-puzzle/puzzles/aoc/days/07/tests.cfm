<cfscript>
//   it( "Specific tests for this day", function( ) {
//     var newPuzzle = puzzle.init();

//     newPuzzle.setTestData( "abba[mnop]qrst
// abcd[bddb]xyyx
// aaaa[qwer]tyui
// ioxxoj[asdfgh]zxcvbn" );
//     newPuzzle.setExpectedResult( 2 );

//     expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
//   });

  it( "Specific tests for this day (part 2)", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb" );
    newPuzzle.setExpectedResult( 3 );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Test Part 2", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setExpectedResult( "" );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>