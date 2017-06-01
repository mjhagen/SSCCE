component {
  this.name = "sscce-itunes";

  function onRequestStart(string targetPage) {
    var itunes = createObject( "COM", "iTunes.Application" );
    writeDump(itunes);
  }
}