component {
  foo = { bar = {} };

  try { writeOutput( isNull( foo[ "bar" ] ) ); } catch ( any e ) { writeOutput( e.message ); }
  try { writeOutput( isNull( foo[ "baz" ] ) ); } catch ( any e ) { writeOutput( e.message ); }
}