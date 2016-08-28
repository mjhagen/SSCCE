<cfscript>
numberOfItterations = 10000;
testData = [];
arrayResize( testData, 500 );

function everyItteration() {
  for( var i=1; i <= arrayLen( testData ); i++ ) {
    // no-op
  }
}

function usingVar() {
  var lengthOfArray = arrayLen( testData );
  for( var i=1; i <= lengthOfArray; i++ ) {
    // no-op
  }
}

// ------------------------

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "everyItteration" );
  everyItteration();
  request.benchmark.stop();
}

for( i=0; i<numberOfItterations; i++ ) {
  request.benchmark.start( "usingVar" );
  usingVar();
  request.benchmark.stop();
}

request.benchmark.output();
</cfscript>