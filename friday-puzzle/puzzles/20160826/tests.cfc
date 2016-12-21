component extends=cfroot.tests.basetests {
  public void function run( ) {
    super.run( );

    describe( "Solve puzzle", function( ) {
      it( "Expects Jaspers version to work as well", function( ) {
        var expectedResult = puzzle.getExpectedResult( );
        var solution = puzzle.solveJp( );
        expect( solution ).toBe( expectedResult );
      } );
    } );
  }
}