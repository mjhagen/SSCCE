<cfquery name="q" blockfactor="5">
  SELECT * FROM test
</cfquery>

<cfdump var="#q.name[ 10 ]#">