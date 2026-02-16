<cfhttp url="https://www.quackit.com/coldfusion/tutorial/">

<cfoutput>

  #htmlCodeFormat(left(trim(cfhttp.filecontent), 100))#

</cfoutput>

<br></br>

<cfhttp url="https://www.quackit.com/coldfusion/tutorial/">

<cfset sStartString = cfhttp.filecontent>

<cfset sStartTag = FindNoCase("<!-- Start Syndication -->", sStartString)>

<cfset sTempString = RemoveChars(sStartString,1, sStartTag-1)>

<cfset sEndTag = FindNoCase("<!-- End Syndication -->", sTempString)>

<cfset sFinalString = RemoveChars(sTempString,sEndTag+24,len(sTempString))>

<cfoutput>

   #sFinalString#

</cfoutput>