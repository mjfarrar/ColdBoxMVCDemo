component extends="coldbox.system.EventHandler"{

	// Default Action
	function index( event, rc, prc ){
		if(StructKeyExists(rc, "username") && rc.username != null && rc.username != ""){
			prc.message = "Welcome" + rc.username;
			event.setView("main/index");
		}else{
            setNextEvent(event="Login.index");
		}
	}

	// Do something
	function doSomething( event, rc, prc ){
		setNextEvent("main.index");
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ){

	}

	function onRequestStart( event, rc, prc ){

	}

	function onRequestEnd( event, rc, prc ){

	}

	function onSessionStart( event, rc, prc ){

	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException( event, rc, prc ){
		//Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		//Place exception handler below:

	}

	function onMissingTemplate( event, rc, prc ){
		//Grab missingTemplate From request collection, placed by ColdBox
		var missingTemplate = event.getValue("missingTemplate");

	}

}