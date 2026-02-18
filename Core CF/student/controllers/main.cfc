
component accessors="true" {

    property name="studentService";

    public any function init(fw) {
        variables.fw = fw;
        return this;
    }

  
    public function default(rc) {
        rc.students = studentService.getAllStudents();
    }

 
    public function save(rc) {
        try {
            var name   = trim(rc.name ?: "");
            var email  = trim(rc.email ?: "");
            var course = trim(rc.course ?: "");

            studentService.addStudent(name, email, course);

            variables.fw.redirect("main.default");
        } catch (any e) {
            rc.message = "Error: " & e.message;
        }
    }
    public  function delete(struct rc) {
        try {
            if (structKeyExists(rc, "id")) {
                studentService.deleteStudent(rc.id);
                rc.message = "Student deleted successfully.";
            } else {
                rc.message = "Invalid student ID.";
            }
        } catch (any e) {
            rc.message = "Error deleting student: " & e.message;
        }

        // Redirect back to main list
        fw.redirect("main.default");
    }
public  function edit(struct rc) {
        if (structKeyExists(rc, "id")) {
            rc.student = studentService.getStudentById(rc.id);
        } else {
            rc.student = {};
        }
    }

   public function update(struct rc) {
    try {
        studentService.updateStudent(
            rc.id,
            rc.name,
            rc.email,
            rc.course
        );

        variables.fw.redirect("main.default");

        variables.fw.setView(""); 
    } catch (any e) {
        writeOutput("<h3 style='color:red;'>Error updating student: #e.message#</h3>");
    }
}

    
}
