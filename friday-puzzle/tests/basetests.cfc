component extends=testbox.system.BaseSpec {
  if( !isNull( request.puzzle ) ) {
    variables.puzzle = request.puzzle;
  }

  public void function beforeAll() {
    addMatchers({
               toBeJSON = function( expectation, args = {}) { return isJSON( expectation.actual ); },
            notToBeJSON = function( expectation, args = {}) { return !isJSON( expectation.actual ); },
         toBeInstanceOf = function( expectation, args = {}) { return isInstanceOf( expectation.actual, args[1] ); },
      notToBeInstanceOf = function( expectation, args = {}) { return !isInstanceOf( expectation.actual, args[1] ); },
         toHaveKeyValue = function( expectation, args = {}) { return arrayLen( structFindValue( { str = expectation.actual }, args[1], "one" )) > 0; }
    });
  }

  public void function run() {
    describe( "Base puzzle integrity test", function( ) {
      it( "Expects puzzle to have all required methods", function( ) {
        expect( puzzle )
          .toBeComponent()
          .toHaveKey( "solve" )
          .toHaveKey( "getExpectedResult" )
          .toHaveKey( "getTestData" );

        expect( puzzle.solve )
          .toBeTypeOf( "function" );
      });
    });

    describe( "Solve puzzle", function( ) {
      it( "Expects expected result to match itself (sanity check)", function( ) {
        var expectedResult = puzzle.getExpectedResult();
        expect( puzzle.sanityCheck() )
          .toBe( expectedResult );
      });

      it( "Expects puzzle to match expected result", function( ) {
        var expectedResult = puzzle.getExpectedResult();
        var solution = puzzle.solve();
        expect( solution )
          .toBe( expectedResult );
      });
    });
  }
}