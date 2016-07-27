component {
  this.name = "sscce-timeout";
  this.timeout = 1;

  function onRequest() {
    wait( 5 );
  }

  function onError() {
    writeDump( arguments );
  }
}