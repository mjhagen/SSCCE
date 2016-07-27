<cfcomponent>
  <cffunction name="testQuery">
    <cfquery name="local.result">
      SELECT  *
      FROM    testtable
      WHERE   data ->> 'booleanValue' = 'true'
    </cfquery>

    <cfdump var="#local.result#">
  </cffunction>
</cfcomponent>