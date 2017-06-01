component accessors="true" {
  property expectedResult;
  property testData;
  property digitMatrix;

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
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ];

    return this;
  }

  function solve( ) {
    rotate90( );

    var decodedInstructions = decodeInstructions( testData );
    var code = "";

    for ( var encodedDigit in decodedInstructions ) {
      code &= findNumber( encodedDigit );
    }

    return code;
  }

  function solvePartTwo( ) {
    variables.digitMatrix = [
      [ '0', '0', '1', '0', '0' ],
      [ '0', '2', '3', '4', '0' ],
      [ '5', '6', '7', '8', '9' ],
      [ '0', 'A', 'B', 'C', '0' ],
      [ '0', '0', 'D', '0', '0' ]
    ];

    return solve( );
  }

  function findNumber( encodedDigit ) {
    for ( var direction in encodedDigit ) {
      movePosition( direction );
    }

    return translateCoordsToDigitMatrix( cursor );
  }

  function movePosition( direction ) {
    var movement = movementMatrix[ direction ];
    var newX = cursor[ 1 ] + movement[ 1 ];
    var newY = cursor[ 2 ] + movement[ 2 ];
    var newCursor = [ newX, newY ];
    var newValue = translateCoordsToDigitMatrix( newCursor );

    if ( newValue != 0 ) {
      variables.cursor = newCursor;
    }
  }

  function translateCoordsToDigitMatrix( coords ) {
    try {
      return digitMatrix[ coords[ 1 ] + 2 ][ coords[ 2 ] + 2 ];
    } catch ( any e ) {
      return 0;
    }
  }

  // helpers:

  function decodeInstructions( instructions ) {
    var instructionsAsArray = listToArray( instructions, chr( 13 ) & chr( 10 ) );
    var output = [ ];

    for ( var digit in instructionsAsArray ) {
      arrayAppend( output, listToArray( digit, "" ) );
    }

    return output;
  }

  function rotate90( ) {
    var n = arrayLen( digitMatrix );
    var result = [ ];

    for ( var i = 1; i <= n; ++i ) {
      result[ i ] = [];
      for ( var j = 1; j <= n; ++j ) {
        result[ i ][ j ] = digitMatrix[ n - j + 1 ][ i ];
      }
    }

    variables.digitMatrix = result;
  }

  function printMatrix( ) {
    var n = arrayLen( digitMatrix );

    writeOutput( "<pre>" );
    for ( var i = 1; i <= n; ++i ) {
      for ( var j = 1; j <= n; ++j ) {
        writeOutput( digitMatrix[ i ][ j ] );
      }
      writeOutput( "<br />" );
    }
    writeOutput( "</pre>" );
  }
}