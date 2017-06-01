<cfscript>
numberOfItterations = 100000;

// ------------------------

variables.foo = "a";

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "scoped" );

  variables.bar = variables.foo;

  request.benchmark.stop();
}

foo = "a";

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "nonscoped" );

  bar = foo;

  request.benchmark.stop();
}

objScoped = new scopespeedScoped();
objNonScoped = new scopespeedNonScoped();

objScoped.setFoo( "a" );

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "cfc-scoped" );

  objScoped.doSomething();

  request.benchmark.stop();
}

objNonScoped.setFoo( "a" );

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "cfc-nonscoped" );

  objNonScoped.doSomething();

  request.benchmark.stop();
}

request.benchmark.output();
</cfscript>