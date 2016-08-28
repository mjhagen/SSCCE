<cfsavecontent variable="sJSON">
{"AgentId":293558,"AgentStateId":1,"AgentStateName":"Available","ContactId":null,"IsACW":false,"FirstName":"John","FromAddress":null,"LastName":"Smith","LastPollTime":"2015-05-21T21:07:43.313Z","LastUpdateTime":"2015-05-21T21:07:40.723Z","MediaName":null,"MediaType":null,"OutStateDescription":null,"OutStateId":null,"SkillId":0,"SkillName":null,"StartDate":"2015-05-21T21:07:40.72Z","TeamId":205970,"TeamName":"Global Help Desk","ToAddress":null}
</cfsavecontent>
<cfset stJSON = deserializeJSON(sJSON)>
<cfdump var="#stJSON#">
<br><br>
CFDUMP says OutStateDescription exists as a structKey, but does it really?
<cfoutput>#structKeyExists(stJSON,"OutStateDescription")#</cfoutput>
<cfoutput>#isNull(stJSON.OutStateDescription)#</cfoutput>