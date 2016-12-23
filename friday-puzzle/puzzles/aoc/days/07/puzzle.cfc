component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "something";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    var counter = 0;

    var ips = listToArray( testData, chr(  13 ) & chr( 10 ) );

    for( var ip in ips ) {
      if( reFind( '\[([^\]]+?)?(\w)(\w)\3\2([^\]]+?)?\]', ip ) == 0 &&
          reFind( '(\w)\1{3,}', ip ) == 0 &&
          reFind( '(\w)(\w)\2\1', ip ) > 0 ) {
        counter++;
      }
    }

    return counter;
  }
}