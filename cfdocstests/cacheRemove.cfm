<cfscript>
cachePut( 'cache_1', 'test data', 1000, 1000, 'test' );
cachePut( 'cache_2', 'test data', 1000, 1000, 'test' );

// this removes both cached objects:
cacheRemove( 'cache', false, 'test', false );


cachePut( 'cache_1', 'test data', 1000, 1000, 'test' );
cachePut( 'cache_2', 'test data', 1000, 1000, 'test' );

// this removes no object:
cacheRemove( 'cache', false, 'test', true );


cachePut( 'cache_1', 'test data', 1000, 1000, 'test' );
cachePut( 'cache_2', 'test data', 1000, 1000, 'test' );

try {
  // this throws an error:
  cacheRemove( 'cache', true, 'test', true );
} catch ( any e ) {
  writeOutput( 'Error: #e.message#' );
}
</cfscript>

<cfdump var='#cacheGetAllIds( 'test' )#'>
