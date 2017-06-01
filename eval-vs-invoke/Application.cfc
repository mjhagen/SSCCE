component {
  request.bestaatniet = 3;

  function onRequest(string targetPage) {
    evaluate( "test( 1, 2, request.bestaatniet )" );
    invoke( this, "test", { een: 1, twee: 2, drie: request.bestaatniet } );
  }



  function test( een, twee, drie ){
    writeDump( arguments );
  }
}