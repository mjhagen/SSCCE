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
    variables.testData = trim( REReplace( testData, "\s", "", "all" ) );

    var compressedLength = len( testData );

    for( var i = compressedLength; i > 0; i-- ) {
      expandChar( i );
    }

    return len( testData );
  }

  function expandChar( start ) {
    var openBracket = find( "(", testData, start );

    if( openBracket == 0 ) {
      return mid( testData, start, 1 );
    }

    var closeBracket = find( ")", testData, openBracket );

    if( closeBracket == 0 || closeBracket < openBracket ) {
      return mid( testData, start, 1 );
    }

    var rawInstruction = mid( testData, openBracket, ( closeBracket + 1 - openBracket ) );
    var instructionLength = len( rawInstruction );

    if( openBracket > 1 && mid( testData, openBracket - 1, 1 ) == ")" ) {
      variables.testData = removeChars( testData, openBracket, instructionLength );
      variables.testData = insert( repeatString( "_", instructionLength ), testData, openBracket - 1 );
      return mid( testData, start, 1 );
    }

    rawInstruction = replace( rawInstruction, "(", "" );
    rawInstruction = replace( rawInstruction, ")", "" );
    var instruction = listToArray( rawInstruction, 'x' );
    var operand = mid( testData, closeBracket + 1, instruction[ 1 ] );

    variables.testData = removeChars( testData, openBracket, instructionLength + len( operand ) );
    variables.testData = insert( repeatString( operand, instruction[ 2 ] ), testData, openBracket - 1 );
  }
}