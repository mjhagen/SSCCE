component {
  this.name="sscce-nullinconsistency";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
  };

  function onRequest() {
    ormReload();

    var asStruct = {
      "nullField" = javaCast( "null", 0 ),
      "otherField" = 1
    };

    var asEntity = entityNew( "objectWithNull", asStruct );

    writeOutput( serializeJSON( asStruct ) & "<br>" );
    writeOutput( serializeJSON( asEntity ) & "<br>" );

    writeDump( asStruct );
    writeDump( asEntity );
  }
}