component extends=cfroot.tests.basetests {
  public void function run() {
    super.run();
    describe( "Additional tests", function( ) {
      it( "Expects the less hack-y version to work the same as solve()", function( ) {
        var expectedResult = puzzle.getExpectedResult();
        var solution = puzzle.lessHackyVersion();
        expect( solution )
          .toBe( expectedResult );
      });
    });
    describe( "Additional tests", function( ) {
      it( "Expects the out-of-order version to work the same as solve()", function( ) {
        var expectedResult = puzzle.getExpectedResult();
        var solution = puzzle.worksWithOutOfOrder();
        expect( solution )
          .toBe( expectedResult );
      });
    });
  }
}