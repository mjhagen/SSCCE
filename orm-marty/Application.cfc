component {
  this.name="sscce-marty";
  this.mappings["/model"]=expandPath("./model");
  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
  };

  function onRequest() {
    ormReload();

    transaction {
      var l = entityNew( "list" );
      entitySave( l );

      var r = entityNew( "row" );
      entitySave( r );

      l.addRow( r );

      r.setList( l );
      r.setTitle( structKeyExists( form, "title" )?form.title:"No Title" );
    }
  }
}