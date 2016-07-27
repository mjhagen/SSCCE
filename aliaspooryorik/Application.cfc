component {
  this.name = "sscce-aliaspooryorik";

  function onRequestStart() {
    var userID = "a431d806-a624-c136-f78b-c68760f8e989";
    var payload = {
          "batch" = [
            {
              "firstname" = 'Mingo',
              "infix" = 'J.'
            }
          ]
        };

    var httpService = new http();
    httpService.setMethod( "PUT" );
    httpService.setURL( "http://mstng.info/api/contact/#userID#" );
    httpService.addParam( type="url", name="reload", value="1" );

    var A = duplicate( httpService );
    A.addParam( type="header", name="content-type", value="application/x-www-form-urlencoded" );
    for( var formData in payload.batch ) {
      for( var key in formData ) {
        A.addParam( type="formField", name=key, value=formData[ key ]);
      }
    }
    var runHttpRequest = A.send();
    var response = runHttpRequest.getPrefix();
    writeOutput( response.fileContent );

    // var B = duplicate( httpService );
    // B.addParam( type="header", name="content-type", value="application/json" );
    // B.addParam( type="body", value=serializeJSON( payload ));
    // var runHttpRequest = B.send();
    // var response = runHttpRequest.getPrefix();
    // writeOutput( response.fileContent );
  }
}