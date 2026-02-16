component accessors = "true" {

property employeeServices;
    
    public function init(fw)
    {

        variables.fw =  fw;
        return this;

    }

    public function index(rc)
    {
        

        rc.employeeindex = employeeServices.getall();

    }

    public function updateEmployee(rc)
    {

        rc.employeedetails = employeeServices.getById(rc.id);

        variables.fw.redirect("employee.index");   

    }
    

    public function addEmployeepage(rc)
    {
        
        
        variables.fw.redirect("employee.addEmployee");   

    }

    public function add(rc)
    {

        
        employeeServices.addEmployee(rc);

        variables.fw.redirect("employee.index");

    }




    public  function delete(rc)
    {

        employeeServices.deleteEmployee(rc);
        variables.fw.redirect("employee.index");


    }

}