component {

   public function createStudentTable() {
    var sql = "
        CREATE TABLE IF NOT EXISTS student (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            email VARCHAR(50) UNIQUE NOT NULL,
            course VARCHAR(50)
        )
    ";
    queryExecute(sql);
}

public array function getAllStudents() {
    var sql = "SELECT id, name, email, course FROM student ORDER BY id DESC";
    var result = queryExecute(sql);
      return queryToArray(result);
}
private array function queryToArray(queryObj) {
    var arr = [];
    for (var row in queryObj) {
        arrayAppend(arr, duplicate(row));
    }
    return arr;
}
    public string function addStudent(required string name, required string email, required string course) {
        var sql = "
            INSERT INTO student (name, email, course)
            VALUES (:name, :email, :course)
        ";

        try {
            queryExecute(
                sql,
                {
                    name:   { value: arguments.name,   cfsqltype: "cf_sql_varchar" },
                    email:  { value: arguments.email,  cfsqltype: "cf_sql_varchar" },
                    course: { value: arguments.course, cfsqltype: "cf_sql_varchar" }
                }
            );
            return "Student added successfully!";
        }
        catch (any e) {
            return "Failed to add student: " & e.message;
        }
    }
public void function deleteStudent(required numeric id) {
    var sql = "
        DELETE FROM student
        WHERE id = :id
    ";
    queryExecute(sql, { id = { value = arguments.id, cfsqltype = "cf_sql_integer" } });
}
public void function deleteStudent(required numeric id) {
    var sql = "
        DELETE FROM student
        WHERE id = :id
    ";
    queryExecute(sql, { id = { value = arguments.id, cfsqltype = "cf_sql_integer" } });
}

 public struct function getStudentById(required numeric id) {
        var q = queryExecute(
            "SELECT id, name, email, course FROM student WHERE id = :id",
            { id: { value: id, cfsqltype: "cf_sql_integer" } }
        );

        // Convert first record to struct
        if (q.recordCount > 0) {
            return {
                id = q.id[1],
                name = q.name[1],
                email = q.email[1],
                course = q.course[1]
            };
        } else {
            return {};
        }
    }

    public void function updateStudent(
        required numeric id,
        required string name,
        required string email,
        required string course
    ) {
        queryExecute(
            "UPDATE student
             SET name = :name, email = :email, course = :course
             WHERE id = :id",
            {
                id: { value: id, cfsqltype: "cf_sql_integer" },
                name: { value: name, cfsqltype: "cf_sql_varchar" },
                email: { value: email, cfsqltype: "cf_sql_varchar" },
                course: { value: course, cfsqltype: "cf_sql_varchar" }
            }
        );
    }
}
