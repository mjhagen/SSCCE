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
    return returnValidTriangles( convertInputToArray() );
  }

  function solvePartTwo( ) {
    return returnValidTriangles( convertInputToArrayForPartTwo() );
  }

  function returnValidTriangles( arrayOfPotentialTriangles ) {
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

  function convertInputToArrayForPartTwo() {
    var inputAsArray = listToArray( reReplace( testData, '\s', ',', 'all' ) );
    var numberOfPoints = arrayLen( inputAsArray );
    var result = [];

    for( var i = 1; i <= numberOfPoints; i++ ) {
      var depot = "arr" & i % 3;

      if( !structKeyExists( local, depot ) ) {
        local[ depot ] = [];
      }

      arrayAppend( local[ depot ], inputAsArray[ i ] );

      if( arrayLen( local[ depot ] ) == 3 ) {
        arrayAppend( result, duplicate( local[ depot ] ) );
        structDelete( local, depot );
      }
    }

    return result;
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