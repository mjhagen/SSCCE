<cfsetting showDebugOutput="false" />

<cfparam name="url.reporter"            default="simple" />
<cfparam name="url.directory"           default="tests" />
<cfparam name="url.recurse"             default="true" type="boolean" />
<cfparam name="url.bundles"             default="" />
<cfparam name="url.labels"              default="" />
<cfparam name="url.reportpath"          default="#expandPath( "/results" )#" />
<cfparam name="url.propertiesFilename"  default="TEST.properties" />
<cfparam name="url.propertiesSummary"   default="false" type="boolean" />

<cfinclude template="/testbox/system/runners/HTMLRunner.cfm" />