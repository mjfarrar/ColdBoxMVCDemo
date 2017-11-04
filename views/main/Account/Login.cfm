<cfoutput>
    <form method="post" action="#event.buildLink("login.login")#">
        <span>Username:</span>
        <input type="text" name="username"/><br/>
        <span>Password:</span>
        <input type="text" name="password"/>
        <br/>
        <input type="submit" value="Submit"/>
    </form>
    
    <cfif len(rc.message)>
      <div>#rc.message#</div>
    </cfif>
</cfoutput>