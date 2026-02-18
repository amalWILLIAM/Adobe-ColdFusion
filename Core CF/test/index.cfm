<cfinclude template="header.cfm">
<cfoutput>
Application Name: #application.applicationName ?: this.name#<br>
App Started At: #application.startedAt#<br>
Session Started At: #session.startedAt#<br>
<a href="/test/variablescope.cfm">Variable Scope</a><br>
<a href="/test/customtag.cfm">Custom tag</a><br>
</cfoutput>
<cfinclude template="footer.cfm">

