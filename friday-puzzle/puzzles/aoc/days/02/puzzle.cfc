component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "84452";

    include "input-data.cfm"; // sets testData

    variables.cursor = [ 0, 0 ];
    variables.movementMatrix = {
      "U" = [  0,  1 ],
      "D" = [  0, -1 ],
      "R" = [  1,  0 ],
      "L" = [ -1,  0 ]
    };
    variables.digitMatrix = [
      [ 7, 4, 1 ],
      [ 8, 5, 2 ],
      [ 9, 6, 3 ]
    ];

    return this;
  }

  function solve( ) {
    var decodedInstructions = decodeInstructions( testData );
    var code = "";

    for ( var encodedDigit in decodedInstructions ) {
      code &= findNumber( encodedDigit );
    }

    return code;
  }

  function findNumber( encodedDigit ) {
    for ( var direction in encodedDigit ) {
      movePosition( direction );
    }

    return translateCoordsToDigitMatrix( cursor );
  }

  function movePosition( direction ) {
    var movement = movementMatrix[ direction ];

    variables.cursor = [
      max( min( cursor[ 1 ] + movement[ 1 ], 1 ), - 1 ),
      max( min( cursor[ 2 ] + movement[ 2 ], 1 ), - 1 )
    ];
  }

  function decodeInstructions( instructions ) {
    var instructionsAsArray = listToArray( instructions, chr( 13 ) & chr( 10 ) );
    var output = [ ];

    for ( var digit in instructionsAsArray ) {
      arrayAppend( output, listToArray( digit, "" ) );
    }

    return output;
  }

  function translateCoordsToDigitMatrix( coords ) {
    return digitMatrix[ coords[ 1 ] + 2 ][ coords[ 2 ] + 2 ];
  }
}