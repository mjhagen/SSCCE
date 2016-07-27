component {
  this.name = "sscce-benchmarks";

  public void function onApplicationStart() {
    application.benchmark = new Benchmark();
  }

  public void function onRequestStart() {
    if( structKeyExists( url, "reload" )) {
      onApplicationStart();
    }

    request.benchmark = application.benchmark;
  }
}