<cfset employee = {
    Name = "AMAL WILLIAM",
    Role = "Jr Software Engineer",
    Age  = 25,
    Place = "Ernakulam"
}>

<cfset serializedata = serializejson(employee)>
<cfoutput>
#serializedata#
</cfoutput>