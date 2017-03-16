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

  for ( i = 0; i < 10000; i++ ) {
    request.benchmark.start( "arrayReverseUsingLoop" );
    arrayReverseUsingLoop( adamsArray );
    request.benchmark.stop( );

    request.benchmark.start( "arrayReverseUsingReduce" );
    arrayReverseUsingReduce( adamsArray );
    request.benchmark.stop( );

    request.benchmark.start( "arrayReverseUsingCollections" );
    arrayReverseUsingCollections( adamsArray );
    request.benchmark.stop( );
  }

  request.benchmark.output( );

</cfscript>