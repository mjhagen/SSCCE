component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "D4CD2EE1";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    return decodePassword( );
  }

  function solvePartTwo( ) {
    return decodePasswordV2( );
  }

  function decodePassword( ) {
    var i = 0;
    var decodedPassword = "";
    var passwordLength = 0;

    do {
      do {
        var testHash = hash( testData & i );
        i++;
      } while ( compare( left( testHash, 5 ), "00000" ) != 0 );

      decodedPassword &= mid( testHash, 6, 1 );
      passwordLength++;
    } while ( passwordLength < 8 );

    return decodedPassword;
  }

  function decodePasswordV2( ) {
    var i = 0;
    var decodedPassword = [ ];
    arraySet( decodedPassword, 1, 8, "" );

    do {
      do {
        var testHash = hash( testData & i );
        i++;
      } while ( !isInteresting( testHash, decodedPassword ) );

      var arrayIndex = mid( testHash, 6, 1 ) + 1;
      var passwordChar = mid( testHash, 7, 1 );

      decodedPassword[ arrayIndex ] = passwordChar;
    } while ( !passwordIsDone( decodedPassword ) );

    return lCase( arrayToList( decodedPassword, "" ) );
  }

  function isInteresting( testHash, decodedPassword ) {
    var firstFiveCharsAreZeros = compare( left( testHash, 5 ), "00000" ) == 0;

    if ( !firstFiveCharsAreZeros ) {
      return false;
    }

    var sixthChar = mid( testHash, 6, 1 );

    if ( !isNumeric( sixthChar ) || sixthChar > 7 || charIsTaken( decodedPassword, sixthChar + 1 ) ) {
      return false;
    }

    return true;
  }

  function charIsTaken( decodedPassword, index ) {
    return decodedPassword[ index ] != "";
  }

  function passwordIsDone( decodedPassword ) {
    for ( var i = 1; i <= 8; i++ ) {
      if ( !charIsTaken( decodedPassword, i ) ) {
        return false;
      }
    }

    return true;
  }
}