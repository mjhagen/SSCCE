component {
  this.name = "sscce-cfhttp";

  function onRequest() {
    hs = new http();


    writeDump( hs.send().getPrefix() );
  }
}
