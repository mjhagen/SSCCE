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

  function decodePassword( ) {
    var decodedPassword = "";
    var usedHashes = [ ];
    var passwordLength = 0;
    var i = 0;

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
}