<cfprocessingdirective pageencoding="utf-8">
<cfset daysOfWeek = ["Rahina", "Ratu", "Raapa", "Rapare", "Ramere", "Rahoroi", "Ratapu"]>
<cfoutput>
    contains("Rahina"): #daysOfWeek.contains("Rahina")#<br />
    contains("RAHINA"): #daysOfWeek.contains("RAHINA")#<br />
    <hr />
    containsNoCase("Ratu"): #daysOfWeek.containsNoCase("Ratu")#<br />
    containsNoCase("RATU"): #daysOfWeek.containsNoCase("RATU")#<br />
    <hr />
    find("Raapa"): #daysOfWeek.find("Raapa")#<br />
    find("RAAPA"): #daysOfWeek.find("RAAPA")#<br />
    <hr />
    findNoCase("Rapare"): #daysOfWeek.findNoCase("Rapare")#<br />
    findNoCase("RAPARE"): #daysOfWeek.findNoCase("RAPARE")#<br />
    <hr />
</cfoutput>