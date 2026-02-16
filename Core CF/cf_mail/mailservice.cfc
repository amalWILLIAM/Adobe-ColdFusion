component {

    public struct function sendmail(required string to,required string subject,required string body)
    {
     
        cfmail(

            to = arguments.to,
            from = "testmail@gmail.com",
            subject = arguments.subject,
            type = "html"

        ){
            writeoutput(arguments.body);
        }

        return{

            status = "success",
            message = "Mail sent"
        };

    }

}