<cfprocessingdirective pageEncoding="utf-8" />

<cfhtmltopdf
    name="pdfFile"
    destination="_testPDF.pdf" overwrite="yes">
    <h1>PDF THAT FAILS</h1>
    <h4>PERSONs NAME: with special characters like á, é, í, ó, ú, ü, ñ </h4>
</cfhtmltopdf>
<cfdump var="#pdfFile#">
<cfabort>