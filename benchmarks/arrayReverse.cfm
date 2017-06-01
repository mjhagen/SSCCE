<cfscript>
  function arrayReverseUsingLoop( required array inArray ) {
    var len = arrayLen( inArray );
    var end = ceiling( len / 2 );
    for ( var i = 1; i <= end; i++ ) {
      var temp = inArray[ i ];
      inArray[ i ] = inArray[ ( len + 1 ) - i ];
      inArray[ ( len + 1 ) - i ] = temp;
    }
    return inArray;
  }

  function arrayReverseUsingReduce( required array inArray ) {
    return inArray.reduce( function( a, v ) {
      a.prepend( v ); return a;
    }, [ ] );
  }

  function arrayReverseUsingCollections( required array inArray ) {
    return createObject( "java", "java.util.Collections" ).reverse( inArray );
  }



  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  adamsArray = [ ];

  for ( i = 0; i < 1000; i++ ) {
    arrayAppend( adamsArray, i );
  }

  variables.arrayOne = duplicate( adamsArray );
  for ( i = 0; i < 1000; i++ ) {
    request.benchmark.start( "arrayReverseUsingLoop" );
    arrayReverseUsingLoop( variables.arrayOne );
    request.benchmark.stop( );
  }

  variables.arrayTwo = duplicate( adamsArray );
  for ( i = 0; i < 1000; i++ ) {
    request.benchmark.start( "arrayReverseUsingReduce" );
    arrayReverseUsingReduce( variables.arrayTwo );
    request.benchmark.stop( );
  }

  variables.arrayThree = duplicate( adamsArray );
  for ( i = 0; i < 1000; i++ ) {
    request.benchmark.start( "arrayReverseUsingCollections" );
    arrayReverseUsingCollections( variables.arrayThree );
    request.benchmark.stop( );
  }

  request.benchmark.output( );

</cfscript>