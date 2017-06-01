<cfquery name="q" blockfactor="5" result="r">
  SELECT * FROM test WHERE id = <cfqueryparam value="1" cfsqltype="cf_sql_integer" />
</cfquery>

<cfdump var="#r#">
<cfdump var="#q.getMetaData().getExtendedMetaData()#">

<cfset q2 = new query(
  sql         = " SELECT *
                  FROM test
                  WHERE id = :id " ) />
<cfset q2.addParam( name="id", value=1, cfsqltype="cf_sql_integer" ) />
<cfset s = q2.execute().getPrefix() />

<cfdump var="#s#">
