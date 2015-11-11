component {
  this.datasource = "sscce";
  this.ormEnabled = true;
  this.ormSettings.dbCreate = "dropcreate";
  this.ormSettings.cfcLocation = "/model";

  public void function onRequest() {
    ormReload();
    writeDump( entityLoad( "second" ) );
  }
}