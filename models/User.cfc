component singleton="true"{

    function validateLogin(string username, string password){
        var user = getUserInfo(username);

        if(user == null)
        {
            return false;
        }
        var hashedPassword = getHashedPassword(user.password, user.salt);

        return hashedPassword == user.password; 
    }

    function hashPassword(string password)
    {
        variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512");

        variables.hashedPassword = Hash(password & variables.salt, "SHA-512");

        return variables;
    }

    function getHashedPassword(string password, string salt)
    {
        var hashedPassword = Hash(arguments.password & arguments.salt, "SHA-512");
        return hashedPassword;
    }

    function getUserInfo(string username)
    {
        var query = new query();
        query.datasource("sportsdatabase");
        query.addParam(name="username",value="username",cfsqltype="cf_sql_varchar");
        WriteDump(query);
        abort;
        var result = query.execute("Select Top 1 * from Users where UserName = :username");
        return result.getResult();
    }
}