component accessors=true {
  property fw;
  property persistenceService;

  function default( rc ) {
    var data = {
          "foo" = {
            "id" = 1,
            "name" = "Foo"
          }
        };
    var foo = persistenceService.save( data );
    writeDump( foo.getEntityName() );
  }
}