component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "869";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    var arrayOfPotentialTriangles = convertInputToArray();

    var validTriangles = 0;

    for( var potentialTriangle in arrayOfPotentialTriangles ) {
      if( isValidTriangle( potentialTriangle ) ) {
        validTriangles++;
      }
    }

    return validTriangles;
  }

  function isValidTriangle( sides ) {
    return sides[ 1 ] + sides[ 2 ] > sides[ 3 ] &&
           sides[ 3 ] + sides[ 1 ] > sides[ 2 ] &&
           sides[ 2 ] + sides[ 3 ] > sides[ 1 ];
  }

  function convertInputToArray() {
    var result = [];
    var inputAsArray = listToArray( testData, chr( 13 ) & chr( 10 ) );
    for( var triangle in inputAsArray ) {
      var triangleAsArray = listToArray( triangle, " " );
      arrayAppend( result, triangleAsArray );
    }
    return result;
  }
}