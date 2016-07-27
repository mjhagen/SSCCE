<cfscript>

a = [1,2,3];
c = createObject( "java", "java.util.Collections" );
c.reverse(a);

writeDump( a );

</cfscript>