<cfscript>

    mailservice = new mailservice();

    result = mailservice.sendmail(

        to = url.to,
        subject = url.subject,
        body = url.body

    );
    
    writeoutput(serializeJSON(result));
</cfscript>

