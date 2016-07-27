component extends=framework.one {
  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate",
    sqlScript = "nuke.sql",
    flushAtRequestEnd = false,
    autoManageSession = false
  };
  function setupRequest() {
    ORMReload();
  }
}