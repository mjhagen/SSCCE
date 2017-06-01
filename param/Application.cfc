component {
  this.name = "sscce-param";

  function onRequest() {
    param test = {};
    param name="test2" default={};
    param name="test5" default={ };

    var test3 = {};

    test4 = {};

    writeDump( variables );
  }
}