component {
  this.name="sscce-datatype";

  this.ormEnabled = true;
  this.ormSettings = {
    datasource = "sscce",
    dbCreate = "dropcreate"
  };

  function onRequest() {
    ORMReload();
    var testObj = entityNew( "datatype" );
    entitySave( testObj );
    testObj.setTestField( 256 );
    ORMFlush();




    var testSearch = ORMExecuteQuery( "FROM datatype WHERE testField BETWEEN :rangeA AND :rangeB", { rangeA = 200, rangeB = 300 });
    writeDump( testSearch );




    var rangeA = 200;
    var rangeB = 300;

    var testSearch = ORMExecuteQuery( "FROM datatype WHERE testField BETWEEN :rangeA AND :rangeB", { rangeA = rangeA, rangeB = rangeB });
    writeDump( testSearch );




    var rangeA = 200;
    var rangeB = 300;
    var params = {
      rangeA = rangeA,
      rangeB = rangeB
    };

    var testSearch = ORMExecuteQuery( "FROM datatype WHERE testField BETWEEN :rangeA AND :rangeB", params );
    writeDump( testSearch );
  }
}