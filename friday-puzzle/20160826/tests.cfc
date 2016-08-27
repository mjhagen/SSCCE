component extends=cfroot.basetests {
  public void function run() {
    super.run();

    describe( "Additional tests", function( ) {
      it( "Expects puzzle to match expected result", function( ) {
        var expectedResult = puzzle.getExpectedResult();
        var solution = puzzle.lessHackyVersion();
        expect( solution )
          .toBe( expectedResult );

      });
    });
  }
}
