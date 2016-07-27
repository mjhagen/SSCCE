component extends="framework.one" {
  this.ormEnabled = true;
  this.ormSettings = {
    DBCreate = "dropcreate",
    datasource = "sscce",
    CFCLocation = "/model"
  };

  request.appName = this.name;

  framework.diLocations = [ "model/services", "controllers" ];

  function setupRequest() {
    ORMReload();
  }
}