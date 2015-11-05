component
{
  this.name = "ormPlayground";
  this.datasource = "mingo";
  this.ormEnabled = true;
  this.ormSettings.dbcreate = "dropcreate";
  this.ormSettings.saveMapping = true;

  function onRequestStart()
  {
    ormreload();
  }
}