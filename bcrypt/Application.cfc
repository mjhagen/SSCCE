component {
  this.name = "bcrypt";
  this.javaSettings = {
    loadPaths = [ expandPath( "./lib/jBCrypt-0.4.jar" ) ]
  };

  function onRequest() {
    writeDump( createObject( "java", "org.mindrot.jbcrypt.BCrypt" ));
  }
}