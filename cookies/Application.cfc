component {
  this.name = "sscce-cookies";

  function onRequest() {
    if( structKeyExists( url, "reload" )) {
      structClear( cookie );
      writeDump( cookie );
    }

    if( !structKeyExists( cookie, "COUNTER" ) || !isNumeric( cookie["COUNTER"] )) {
      cookie["COUNTER"]=0;
    }

    cookie["COUNTER"]++;

    writeDump( cookie );
  }
}