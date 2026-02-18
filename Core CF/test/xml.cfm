<cfset xmlText = fileRead("/opt/lucee/tomcat/webapps/ROOT/test/custorder.xml")>

<!--- Parse without DTD validation --->
<cfset myDoc = XMLParse(xmlText, true)>

<cfoutput>
#myDoc#
</cfoutput>
