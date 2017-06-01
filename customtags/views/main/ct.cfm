<cfdump var="#request.context#">
<cfdump var="#local#">
<cfdump var="#attributes#">
<cfdump var="#caller.local.rc#">
<cfdump var="#test()#">

<cffunction name="test">
  <cfset var x = 2 />
  <cfreturn local />
</cffunction>