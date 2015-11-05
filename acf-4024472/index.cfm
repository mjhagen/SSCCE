<cfset fido = entityNew( "dog" ) />
<cfset entitySave( fido ) />
<cfset fido.setName( "Fido" ) />
<cfdump var="#fido#" />