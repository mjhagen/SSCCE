component {
  this.name = "cf2016-query";

  tempQuery = queryNew( "id,name", "integer,varchar" );
  queryAddRow( tempQuery );
  querySetCell( tempQuery, "id", 1, 1 );
  querySetCell( tempQuery, "name", "test", 1 );

  q1 = duplicate( tempQuery );

  sql = "SELECT * FROM q1";
  options = {
    dbType = "query"
    , cachedWithin = createTimeSpan( 0, 0, 3, 0 )
  };

  q2 = duplicate( queryExecute( sql, [], options ));

  q1recordCount = q1.recordCount;
  q2recordCount = q2.recordCount;

  writeDump( q1 );
  writeDump( q1recordCount );

  writeDump( q2 );
  writeDump( q2recordCount );
}