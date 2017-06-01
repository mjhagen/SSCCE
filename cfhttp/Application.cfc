component {
  this.name = "sscce-cfhttp";

  function onRequest() {
    hs = new http();

    hs.setUrl( "https://test-api.handlingcompany.nl/api/index/login?Apikey=" );

    writeDump( hs.send().getPrefix() );
  }
}