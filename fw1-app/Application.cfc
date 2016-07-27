component extends=framework.one {
  // this.name = "sscce-fw1-app";
  function onRequestStart(string targetPage) {
    super.onRequestStart(targetPage);
    application.test = 1;
  }
}