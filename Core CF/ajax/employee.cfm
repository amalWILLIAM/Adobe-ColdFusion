<h3>Update Employee</h3>

<input type="text" id="name" placeholder="Name"><br><br>
<input type="text" id="role" placeholder="Role"><br><br>
<input type="text" id="email" placeholder="Email"><br><br>

<button onclick="updateEmployee()">Update</button>

<p id="result"></p>

<script>
function updateEmployee() {

    const data = new URLSearchParams();
    data.append("id", 5);
    data.append("name", document.getElementById("name").value);
    data.append("role", document.getElementById("role").value);
    data.append("email", document.getElementById("email").value);

    fetch("model/Employee.cfc?method=updateEmployee", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data.toString()
    })
    .then(res => res.json())
    .then(response => {
        document.getElementById("result").innerHTML = response.message;
    });
}
</script>
