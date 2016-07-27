component {
  this.name = "sscce-postgres-jsonb";
  this.datasource = "sscce";

  // this.ormEnabled = true;
  // this.ormSettings = {
  //   dbCreate = "dropcreate",
  //   sqlScript = "populate.sql"
  // };

  function onRequest() {

    var x = new foo();



    // ormReload();

    // var q = "
    //   SELECT  testtable.id    AS id,
    //           testtable.name  AS name,
    //           CAST( testtable.data AS character varying( 512 ))
    //                           AS data

    //   FROM    testtable

    //   WHERE   testtable.data ->> 'booleanValue' = 'true'
    // ";

    // var result = ORMGetSession().createSQLQuery( q ).addEntity( 'testtable' ).list();

    // writeDump( result );
  }
}