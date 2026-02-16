component {

    public struct function fetchuser()
    {

        cfhttp(
            url = "https://jsonplaceholder.typicode.com/users/1",
            method = "Get",
            result = "res"
        );

        return deserializeJSON(res.filecontent);

    }

}