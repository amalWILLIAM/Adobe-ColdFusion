component accessors = "true" {

    property departmentServices;

    public function init(fw)
    {

        variables.fw = fw;
        return this;

    }

    public function index(rc)
    {

        rc.departmentindex = departmentServices.getall();

    }


    public function add(rc)
    {

        departmentServices.addDepartment(rc);

        variables.fw.redirect("department.index");

    }

    public function updateDepartment(rc)
    {

        rc.departmentDetails = departmentServices.getById(rc.id);


    }

    public function update(rc)
    {

        departmentServices.updateDepartment(rc);

        variables.fw.redirect("department.index");

    }

    public function delete(rc)
    {

        departmentServices.deleteDepartment(rc);

        variables.fw.redirect("department.index");

    }




}