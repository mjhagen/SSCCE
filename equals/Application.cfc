component {
  this.name = "sscce-equals";

  objOne = {"test"=123,"test2"={"test3"=[1,2,{"test4"=true,"test5"=["test6",javaCast("null",0)]}]}};
  objTwo = {"test"=123,"test2"={"test3"=[1,2,{"test4"=true,"test5"=["test6","null"]}]}};

  function equalsCommons( lhs, rhs ) {
    var equalsBuilder = createObject( "java", "org.apache.commons.lang.builder.EqualsBuilder" );
    return equalsBuilder.append( lhs, rhs ).isEquals( );
  }

  function equalsLucee( lhs, rhs ) {
    return lhs.toString().compareNocase( rhs.toString() ) == 0;
  }

  function equalsJava( lhs, rhs ) {
    return lhs.equals( rhs );
  }

  writeDump( equalsCommons( objOne, duplicate( objOne ) ) );

  writeDump( equalsCommons( objOne, objTwo ) );

  writeDump( equalsLucee( objOne, objTwo ) );

  writeDump( equalsJava( objOne, objTwo ) );
}