<cfset data = {
    firstname = "AMAL",
    Secondname = "William",
    Role = "Developer"
}>

<cfset jsonText = SerializeJSON(data)>
<cfset deserializedata = DeserializeJSON(jsonText)>
<cfoutput>
#SerializeJSON(deserializedata)#
</cfoutput>
