component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = 105;

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    var counter = 0;

    var ips = listToArray( testData, chr( 13 ) & chr( 10 ) );

    for ( var ip in ips ) {
      if ( hasTLS( ip ) ) {
        counter++;
      }
    }

    return counter;
  }

  function hasTLS( ip ) {
    return reFind( '\[([^\]]+?)?(\w)(\w)\3\2([^\]]+?)?\]', ip ) == 0 &&
           reFind( '(\w)\1{3,}', ip ) == 0 &&
           reFind( '(\w)(\w)\2\1', ip ) > 0;
  }

  function solvePartTwo( ) {
    var counter = 0;

    var ips = listToArray( testData, chr( 13 ) & chr( 10 ) );

    for ( var ip in ips ) {
      if ( hasSSL( ip ) ) {
        counter++;
      } else {
        writeOutput( ip & "<br />" );
      }
    }

    return counter;
  }

  function hasSSL( ip ) {
    return reFind( '\w{0,}((\w)(?!\2)(\w)\2)\w{0,}\[.{0,}(\3\2\3).{0,}\]|\[.{0,}((\w)(?!\6)(\w)\6).{0,}\]\w{0,}(\7\6\7)\w{0,}', ip ) > 0;
  }
}

