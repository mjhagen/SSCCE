component {
  this.name="sscce-searchImplicitScopes";

  function foo( bar ) {
      bar = "test";
      writeDump( arguments );
      writeDump( local );
      writeDump( variables );
  }

  foo();
}