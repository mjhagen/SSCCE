component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "qtbjqiuq";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    return solution( );
  }

  function solvePartTwo( ) {
    return solution( 2 );
  }

  function solution( part = 1 ) {
    var result = "";
    var messageLength = len( listFirst( trim( testData ), chr( 13 ) & chr( 10 ) ) );
    var messageData = reReplace( testData, "\s", "", "all" );
    var uncorrectedMessageLength = len( messageData );
    var alphabet = listToArray( "abcdefghijklmnopqrstuvwxyz", "" );
    var i = 0;
    var dataBin = [];

    arraySet( dataBin, 1, messageLength, "" );

    do {
      i++;

      var char = mid( messageData, i, 1 );
      var bin = i % messageLength;
      if( bin == 0 ) { bin = messageLength; }

      dataBin[ bin ] = listAppend( dataBin[ bin ], char );

    } while ( i < uncorrectedMessageLength );

    for( var uncorrectedLetter in dataBin ) {
      var charCounts = {};

      for( var letter in alphabet ) {
        var charCount = listValueCount( uncorrectedLetter, letter );
        if( charCount > 0 ) {
          charCounts[ letter ] = charCount;
        }
      }

      sortedKeys = structSort( charCounts, "numeric", part == 1 ? "desc" : "asc" );

      result &= sortedKeys[ 1 ];
    }

    return result;
  }
}