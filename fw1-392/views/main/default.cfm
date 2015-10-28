<p>Hello FW/1!</p>

<cfhttp url="http://localhost/SSCCE/fw1-392/api/myObject" method="DELETE"></cfhttp>

<cfoutput>#cfhttp.fileContent#</cfoutput>