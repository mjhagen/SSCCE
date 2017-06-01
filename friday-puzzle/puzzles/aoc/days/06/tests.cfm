<cfscript>
  it( "Specific tests for this day", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar" );
    newPuzzle.setExpectedResult( "easter" );

    expect( newPuzzle.solve( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Specific tests for this day (part 2)", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setTestData( "eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar" );
    newPuzzle.setExpectedResult( "advent" );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });

  it( "Run Part Two (akothqli)", function( ) {
    var newPuzzle = puzzle.init();

    newPuzzle.setExpectedResult( "akothqli" );

    expect( newPuzzle.solvePartTwo( ) ).toBe( newPuzzle.getExpectedResult() );
  });
</cfscript>