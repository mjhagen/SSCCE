<cfset jdbcDriver = CreateObject("java", "macromedia.jdbc.sqlserver.SQLServerDriver")>


<cfoutput>
#jdbcDriver.getMajorVersion()#.#jdbcDriver.getMinorVersion()#
</cfoutput>

<cfdump var="#jdbcDriver#">