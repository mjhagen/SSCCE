component {
  this.name="sscce-temp";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    saveMapping = false
  };

  function onRequest() {
    ormReload();
  }
}