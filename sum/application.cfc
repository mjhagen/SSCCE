component {
  this.mappings["/sscce"] = expandPath( "../" );
  variables.bm = new sscce.benchmark();

  function onRequest() {
    var q = queryNew( "value", "integer", [[1], [2], [3], [4]]);

    for( var i=1; i<10000; i++ ) {
      bm.start( "A" );
      arraySum( q["value"] );
      bm.stop();
    }

    for( var i=1; i<10000; i++ ) {
      bm.start( "B" );
      arraySum( listToArray( valueList( q.value )));
      bm.stop();
    }

    // for( var i=1; i<10000; i++ ) {
    //   bm.start();
    //   q.columnData( "value" ).sum();
    //   bm.stop();
    // }

    bm.output();
  }
}