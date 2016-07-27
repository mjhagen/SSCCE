<cfcomponent>
  <cfscript>
    this.name = "acf-cookie";
    variables.testVar = { hello = "world" };
    cookie.test_a = testVar;
  </cfscript>

  <cftry>
    <cfcookie name="test_b" value="#testVar#" />
    <cfcatch>
      <cfoutput>#cfcatch.message#</cfoutput>
    </cfcatch>
  </cftry>

  <cfdump var="#cookie#">
</cfcomponent>