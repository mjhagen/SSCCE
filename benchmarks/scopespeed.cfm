<cfscript>
numberOfItterations = 100000;
objScoped = new scopespeedScoped();
objNonScoped = new scopespeedNonScoped();

// ------------------------

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "scoped" );

  objScoped.setFoo( "a" );
  objScoped.doSomething();

  request.benchmark.stop();
}

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "nonscoped" );

  objNonScoped.setFoo( "a" );
  objNonScoped.doSomething();

  request.benchmark.stop();
}

request.benchmark.output();
</cfscript>