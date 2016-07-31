component {
  this.name = "sscce-queryExecute";
  this.datasource = "sscce";
  function onRequest() {
    queryExecute( "
      CREATE TABLE IF NOT EXISTS test ( id int, name varchar );
      DELETE FROM test;
      INSERT INTO test VALUES ( 1, 'Mingo' );
      INSERT INTO test VALUES ( 2, 'Adam' );
      INSERT INTO test VALUES ( 3, 'John' );
    " );

    var q = queryExecute( "SELECT * FROM test WHERE id IN ( :ids )", {ids={value="1,2", cfsqltype="cf_sql_integer", list="true"}});

    writeDump( q );
  }
}