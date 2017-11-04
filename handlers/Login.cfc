component extends="coldbox.system.EventHandler"{

    function index(event, rc, prc){
        param name="rc.message" default="";
        event.setView("main/account/login")
    }

    function login(event, rc, prc){
        param name="prc.message" default="";
        var user = getModel("User");
        var isLoggedIn = user.validateLogin(rc.username, rc.password);
        if(isLoggedIn){
            setNextEvent(event="Main.index", persist="username");
        }
        // set the invalid message
        rc.message = "Your credentials are invalid. Please try again";

        //return to login scr - no good
        setNextEvent(event='Login.index', persist="message");
    }

}