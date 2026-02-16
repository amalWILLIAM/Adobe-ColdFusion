
component accessors="true" {

    property name="studentService";

    function default(rc) {
        try {
            
            rc.message = studentService.createStudentTable();
               
           
        } catch (any e) {
            rc.message = "Error: " & e.message;
        }
    }

}
