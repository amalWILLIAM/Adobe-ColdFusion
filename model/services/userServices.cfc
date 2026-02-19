component accessors = "true" {

    public function init(fw)
    {

        variables.fw = fw;
        return this;

    }

    public function userRegister(rc)
    {

        rc.password = hash(rc.password, "SHA-256");
        
        queryExecute("INSERT INTO users(username,email,password)
            VALUES(:username,:email,:password)",
            {

            username : {value = rc.username, cfsqltype = "cf_sql_varchar"},
            email    : {value = rc.email, cfsqltype = "cf_sql_varchar"},
            password : {value = rc.password, cfsqltype = "cf_sql_varchar"}

            }
        );

    }

    public function Login(rc)
    {

        var user = queryExecute("SELECT user_id,username,email,password,role FROM users WHERE email = :email",
                        {

                            email : {value = rc.email, cfsqltype = "cf_sql_varchar"}

                        }

            );

        if(user.recordCount EQ 1){

            var hashedpassword = hash(rc.password, "SHA-256");

            if(hashedpassword EQ user.password){

                session.user = {

                    userID   : user.user_id,
                    username : user.username,
                    email    : user.email,
                    role     : user.role

                };


                return true;

            } 

        }
          
        return false;
    }
    
    /* Admin backend methods */
    public function getAllUsers(){
        return queryExecute("SELECT user_id,username,email,role FROM users ORDER BY user_id DESC");
    }

    public function getNonAdminUsers(){
        return queryExecute("SELECT user_id,username,email,role FROM users WHERE role <> 'admin' ORDER BY user_id DESC");
    }

    public function getUserById(rc){
        var uid = "";
        if (structKeyExists(rc, 'user_id')){
            uid = rc.user_id;
        } else if (structKeyExists(rc, 'USER_ID')){
            uid = rc.USER_ID;
        } else {
            for (var k in rc){
                if (lcase(trim(k)) == 'user_id'){
                    uid = rc[k]; break;
                }
            }
        }

        return queryExecute("SELECT Exception in onError
The action admin.dashboard failed.

Unable to find a view for ':main.error' action.
'/shopping_website/views/main/error.cfm' does not exist. (FW1.viewNotFound)

Exception - click to expand
Catch
Original exception in onRequest
The action admin.dashboard failed.

variable [ORDERSERVICES] doesn't exist
(expression)

Exception - click to expand
Structuser_id,username,email,role FROM users WHERE user_id = :user_id", {
            user_id: {value = uid, cfsqltype = "cf_sql_integer"}
        });
    }

    public function updateUser(rc){
        queryExecute("UPDATE users SET username = :username, email = :email, role = :role WHERE user_id = :user_id", {
            username: {value = rc.username, cfsqltype = "cf_sql_varchar"},
            email: {value = rc.email, cfsqltype = "cf_sql_varchar"},
            role: {value = rc.role, cfsqltype = "cf_sql_varchar"},
            user_id: {value = rc.user_id, cfsqltype = "cf_sql_integer"}
        });
    }

    public function deleteUser(rc){
        var uid = "";
        if (structKeyExists(rc, 'user_id')){
            uid = rc.user_id;
        } else {
            for (var k in rc){
                if (lcase(trim(k)) == 'user_id'){
                    uid = rc[k]; break;
                }
            }
        }
        queryExecute("DELETE FROM users WHERE user_id = :user_id", {
            user_id: {value = uid, cfsqltype = "cf_sql_integer"}
        });
    }
    
    public function totalUsers(){
        return queryExecute("SELECT COUNT(*) AS count FROM users");
    }
    
}