/*
 * ===================================================================
 * COMPONENT/CLASS
 * Application
 *
 * PURPOSE
 * Defines certain ColdFusion application operating parameters, the
 * Application.cfc is called on every single ColdFusion request, and
 * specific methods automatically run, depending upon the order of
 * events within the application lifecycle. This is an example of
 * an Application.cfc written in pure cfscript. For a better under-
 * standing of Application.cfc's properties and methods, please
 * read the Adobe ColdFusion 9 documentation:
 * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-74fa.html
 *
 * AUTHOR
 * Steve 'Cutter' Blades [C], webDOTadminATcutterscrossingDOTcom
 *
 * REVISIONS
 * ===================================================================
 * [C 10.07.09]
 * Initial creation
 * ===================================================================
 * @output false
 */
component persistent = "false" {

  // http://help.adobe.com/en_US/ColdFusion/9.0/Developing/WSc3ff6d0ea77859461172e0811cbec22c24-7d39.html#WSc3ff6d0ea77859461172e0811cbec22c24-68e0
  this.name = this.name = hash( getBaseTemplatePath() );;
  this.applicationTimeout = createTimespan(0, 2, 0, 0);
  // this.clientManagement = true|false;
  // this.clientStorage = "cookie|registry|[dsn]";
  this.customTagPaths = ExpandPath("/customTags");
  // this.googleMapKey = "[Google Map API key]";
  this.dataSource = "sscce"; // With this I don't need to include the attribute in my cfquery tags
  // this.loginStorage = "cookie|session";
  // this.mappings = {cfc="#expandPath("/cfc")#",mapping2="loc2"}; /* I haven't tried this syntax yet */



  this.serverSideFormValidation = false; // this is 'true' by default, but I like to write my own
  this.sessionManagement = "yes";

  this.loginstorage="session";

  this.sessionTimeout = createTimespan(0, 0, 20, 0);
  this.setClientCookies = true;
  this.setDomainCookies = true;
  this.scriptProtect = true;
  // this.secureJSON = true|false;
  // this.secureJSONPrefix = "[some couple of characters to prefix all JSON]";
  // this.welcomeFileList = "[comma delimited list of file names]";
  // this.smtpServerSettings = {server="10.1.93.15",username="someUserName",password="somePassword"};
  this.timeout = 3000; // This overrides the CF Admin's request timeout value, in milliseconds
  // this.debuggingIPAddress = "[List of IP's requiring debugging access]";
  // this.enableRobustException = true|false;



  this.ormenabled = true;
  this.ormsettings = {
    autoGenMap = true,
      dbcreate = "update",
      eventhandling = false,
      flushAtRequestEnd = true,
      cfclocation = ["cfc"],// ["/model", "/other/entities", "/more/other/entites"]
      dialect="MicrosoftSQLServer",
      autoindex =  true,  //This tells ColdFusion to update the ORM index when items are added, updated or deleted
      searchenabled  = true //This turns on ORM search for you application.
      ,logsql = true
  };

  this.customTagPaths = ExpandPath('customtags/');
  // include "functions.cfm";

/*<cfset this.mappings["/model"] = getDirectoryFromPath(getCurrentTemplatePath()) & "model" />*/

  /**
   * FUNCTION onApplicationStart
   * Runs when an application is first initialized
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d48.html
   * @access public
   * @returnType boolean
   * @output false
   */
  function onApplicationStart() {

    return true;
  }

  /**
   * FUNCTION onApplicationEnd
   * Runs when the application times out, or when explicitly called
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d47.html
   * @access public
   * @returnType void
   * @output false
   */
  function onApplicationEnd(required applicationScope) {

  }

  /**
   * FUNCTION onMissingTemplate
   * Runs when a (CF) template is called that does not exist
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d2a.html
   * @access public
   * @returnType boolean
   * @output false
   */
  function onMissingTemplate(required string targetpage) {

    location("404.cfm",false); // not required
    return true;
  }

  /**
   * FUNCTION onRequestStart
   * Runs at the beginning of a request, prior to the processing of
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d41.html
   * the requested template.
   * @access public
   * @returnType boolean
   * @output false
   */
  function onRequestStart(required string thePage) {
    if ( structkeyExists(url,"reload") ) {


      //ApplicationStop(); //ormReload is a friend
      onSessionEnd(SESSION, APPLICATION);
      onApplicationEnd(APPLICATION);
      onApplicationStart();
      onSessionStart();
      ORMReload();
      // appRestarted();
      structclear(session);



    }
    // end

    if ( structkeyExists(url,"ormreload") ) {
      onSessionEnd(SESSION, APPLICATION);
      onApplicationEnd(APPLICATION);
      onApplicationStart();
    }

    if ( structkeyExists(url,"appreload") ) {
      onApplicationStart();
    }
    //session check
    /*if(!structkeyExists(session,"userid") ){

      if ( getfileFromPath(arguments.thePage) neq "login.cfm"){
        location( "login.cfm",false );
      }
    }*/

    //logout handler
    if( structkeyExists(url,"logout") ){

      lock scope="session" type="exclusive" timeout="10" {
        structdelete(session,"userid");
      }

      location("index.cfm",false);
    }

param session.mingo=0;

session.mingo++;

    return true;
  }

  /**
   * FUNCTION onCFCRequest
   * New to CF9, this function runs only at the beginning of a CFC request
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSe821657cd7d6f83f6daaa733122cf6931bb-8000.html
   * @access public
   * @returnType void
   * @output false
   */
  function onCFCRequest(required string cfcname, required string method, required struct args) {

  }

  /**
   * FUNCTION onRequest
   * This runs after the onRequestStart, but still prior to the requested
   * template itself. This method no longer applys to CFC requests
   * (see onCFCRequest() for more information)
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d43.html
   * @access public
   * @returnType void
   * @output true
   */
  function onRequest(required string thePage) {
    include ARGUMENTS.thePage; // When using this method, you must include the requested page
  }

  /**
   * FUNCTION onRequestEnd
   * Runs after a requested template has completed it's process
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d42.html
   * @access public
   * @returnType void
   * @output false
   */
  function onRequestEnd(required string thePage) {

  }

  /**
   * FUNCTION onError
   * This is an application wide error handler. Best practice would be to
   * write process specific error handling, but this method will help
   * you trap unexpected errors for custom notification and process
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d4a.html
   * @access public
   * @returnType void
   * @output true
   */
  function onError(required exception, required string eventname) {
    writeDump({
      var = ARGUMENTS.exception, label = ARGUMENTS.eventname
    }); // not required
  }

  /**
   * FUNCTION onSessionStart
   * Runs when a user first starts there visit to your application.
   * The application will initialize if it's not currently active
   * [through onApplicationStart()]. This method would also run
   * prior to onRequestStart().
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d4b.html
   * @access public
   * @returnType void
   * @output false
   */
  function onSessionStart() {

    //this.setclientcookies=false;this line prevents session loss

  }

  /**
   * FUNCTION onSessionEnd
   * Runs when a user's session times out, or when explicitly called
   * http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d40.html
   * @access public
   * @returnType void
   * @output false
   */
  function onSessionEnd(required struct sessionScope, required struct appScope) {

  }

}