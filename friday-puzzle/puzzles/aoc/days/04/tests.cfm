<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]" );
    newPuzzle.setExpectedResult( 1514 );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>