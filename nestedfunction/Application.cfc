component {
  function test1() {
    function test2() {
      writeOutput( "Hello World" );
      writeDump(local);
    }
    test2();
    writeDump(local);
  }

  test1();
  writeDump(local);
}