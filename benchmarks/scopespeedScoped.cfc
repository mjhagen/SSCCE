component {
  property name="foo";

  function setFoo( string newFoo ) {
    variables.foo = arguments.newFoo;
  }

  function doSomething() {
     return variables.foo;
  }
}