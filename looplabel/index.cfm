<cfset innerThreshold = 6>
<cfset outerThreshold = 11>

<cfoutput>
<cfloop index="x" from="1" to="5" label="outer">
    <cfloop index="y" from="1" to="5" label="inner">
        <cfset sum = x+y>
        <cfset product = x*y>
        <cfif product GT outerThreshold>
        </cfif>
        <cfif sum GT innerThreshold>
        </cfif>
    </cfloop>
</cfloop>
</cfoutput>