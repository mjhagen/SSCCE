<cfscript>
  itterations = 10000;
  testArrayItems = 500;

  function fn1( myArray ) { return arrayLen( myArray ) > 0; }
  function fn2( myArray ) { return arrayLen( myArray ); }
  function fn3( myArray ) { return !arrayIsEmpty( myArray ); }
  function fn4( myArray ) { try { myArray[ 1 ]; return true; } catch ( any e ) { return false; } }

  tests = ( fn1( [ ] ) == false && fn2( [ ] ) == false && fn3( [ ] ) == false && fn4( [ ] ) == false && fn1( [ 1 ] ) == true && fn2( [ 1 ] ) == true && fn3( [ 1 ] ) == true && fn4( [ 1 ] ) == true );

  writeOutput( tests & "<br />" );

  testData = [ ];

  for ( i = 0; i < itterations; i++ ) {
    request.benchmark.start( "Calibration" );
  }

  for ( i = 0; i < itterations; i++ ) {
    request.benchmark.start( "arrayLen( myArray ) > 0" );
    fn1( testData );

    request.benchmark.start( "arrayLen( myArray )" );
    fn2( testData );

    request.benchmark.start( "!arrayIsEmpty( myArray )" );
    fn3( testData );

    request.benchmark.start( "try { return myArray[ 1 ]; } catch ( any e ) { return false; }" );
    fn4( testData );
  }

  arrayResize( testData, testArrayItems );

  for ( i = 0; i < itterations; i++ ) {
    request.benchmark.start( "arrayLen( myArray ) > 0" );
    fn1( testData );

    request.benchmark.start( "arrayLen( myArray )" );
    fn2( testData );

    request.benchmark.start( "!arrayIsEmpty( myArray )" );
    fn3( testData );

    request.benchmark.start( "try { return myArray[ 1 ]; } catch ( any e ) { return false; }" );
    fn4( testData );
  }

  request.benchmark.stop( );
  request.benchmark.output( );
</cfscript>