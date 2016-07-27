component {
  this.name = "jpeg2000";

  public void function onRequest() {
    var imageFile = createObject( "java", "java.io.File" ).init( expandPath( "./TC_NG_Baghdad_IQ_Geo.jp2" ));
    var imageIO = createObject( "java", "javax.imageio.ImageIO" );
    var cfmlImage = imageNew( imageIO.read( imageFile ));

    writeDump( cfmlImage );
  }
}