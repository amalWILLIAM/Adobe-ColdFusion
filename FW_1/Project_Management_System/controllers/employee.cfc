component accessors = "true" {

property employeeServices;
    
    public function init(fw)
    {

        variables.fw =  fw;
        return this;

    }

    public function index(rc)
    {
        //rcpagination
        rc.page = val(rc.page ? : 1);
        rc.pagesize = 5;

        rc.result = employeeServices.getEmployeepaged(rc.page,rc.pagesize);

        rc.employeeindex = rc.result.data;


        rc.totalrows = rc.result.totalrows;

        rc.totalpages = ceiling(rc.totalrows/rc.pagesize);


    }

    public function updateEmployee(rc)
    {

        rc.employeeindex = employeeServices.getById(rc.id);


    }

    public function update(rc)
    {

        employeeServices.updateEmployee(rc);

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

    public function search(rc)
    {


        if(len(trim(rc.queryterm)))
        {

            rc.employees = employeeServices.searchEmployee(queryterm);
           
        }else{

            rc.employees = employeeServices.getall(); 

        }

        fw.setview("employee.index");

    }


}