<cfscript>

for( i=0; i<100000; i++ ) {
  request.benchmark.start( "createUUID" );
  createUUID();
  request.benchmark.stop();
}

request.benchmark.output();
</cfscript>