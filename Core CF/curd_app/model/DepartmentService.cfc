component {

    public query function getAll()
    {

        local.sql = "SELECT dept_id ,dept_name From departments ORDER BY dept_name";

        local.params = {};

        return queryExecute(local.sql,local.params);

    }

}