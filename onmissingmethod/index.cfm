<cfscript>
javaTime = createObject("java", "java.lang.System" );
runs = 100000;
obj = new myCFC();
timers = {
  "normal" = [],
  "omm" = []
};

for( i=1; i <= runs; i++ ) {
  t = javaTime.nanoTime();
    obj.funcA();
  t = javaTime.nanoTime() - t;
  arrayAppend( timers.normal, t );
}

for( i=1; i <= runs; i++ ) {
  t = javaTime.nanoTime();
    obj.funcB();
  t = javaTime.nanoTime() - t;
  arrayAppend( timers.omm, t );
}

normalTime = arrayAvg( timers.normal );
ommTime = arrayAvg( timers.omm );

writeOutput( "Normal: " & normalTime & "ns.<br />" );
writeOutput( "OnMissingMethod: " & ommTime & "ns.<br />" );

writeOutput( ommTime / normalTime );

</cfscript>