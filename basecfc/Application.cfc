component {
  this.name = "sscce-basecfc";
  this.rootDir = getDirectoryFromPath( getCurrentTemplatePath());
  this.mappings = {
    "/" = this.rootDir,
    "/root" = this.rootDir
  };
  this.datasource = "sscce";
  this.ormEnabled = true;
  this.ormSettings = {
    dbCreate = "dropcreate",
    cfcLocation = expandPath( "model" ),
    secondarycacheenabled = false
  };

  public void function onRequestStart() {
    ormReload();
    request.appName = this.name;
    request.context = {
      debug = structKeyExists( url, "debug" ) ? url.debug : false
    };

    writeDump( entityLoad( "test" ));abort;
  }
}