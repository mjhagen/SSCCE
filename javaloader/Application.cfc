component {
  this.name = "jltest";

  paths = directoryList( expandPath( "./lib/" ), false, "*.jar" );

  jl = new javaloader.javaloader( paths );

  try {
    es = jl.create( "org.elasticsearch.common.settings.ImmutableSettings" );
    writeDump( es );
  } catch( any e ) {
    writeDump( e );
  }
}