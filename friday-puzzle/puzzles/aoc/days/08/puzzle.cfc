component accessors="true" {
  property expectedResult;
  property testData;
  property gridSize;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = 106;
    variables.gridSize = [ 6, 50 ];

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    variables.grid = createGrid( );

    var testDataAsArray = listToArray( testData, chr( 13 ) & chr( 10 ) );

    for ( var instructionLine in testDataAsArray ) {
      var instructionParts = listToArray( instructionLine, " " );

      if ( instructionParts[ 1 ] == "rect" ) {
        var x = listFirst( instructionParts[ 2 ], "x" );
        var y = listLast( instructionParts[ 2 ], "x" );
        rect( x, y );
      } else if ( instructionParts[ 1 ] == "rotate" ) {
        var axis = instructionParts[ 2 ];
        var whichOne = listLast( instructionParts[ 3 ], "=" ) + 1;
        var ticks = instructionParts[ 5 ];
        rotate( axis, whichOne, ticks );
      }
    }

    return arrayLen( arrayFindAll( listToArray( printGrid(), '' ), '##' ) );
  }

  function createGrid( ) {
    var rows = variables.gridSize[ 1 ];
    var cols = variables.gridSize[ 2 ];

    var newGrid = [ ];

    for ( var y = 1; y <= rows; y++ ) {
      newGrid[ y ] = [ ];

      for ( var x = 1; x <= cols; x++ ) {
        newGrid[ y ][ x ] = 0;
      }
    }

    return newGrid;
  }

  function rect( x, y ) {
    for ( var i = 1; i <= y; i++ ) {
      for ( var j = 1; j <= x; j++ ) {
        drawPixel( true, i, j );
      }
    }
  }

  function drawPixel( state = true, x, y ) {
    variables.grid[ x ][ y ] = state ? 1 : 0;
  }

  function rotate( axis, whichOne, ticks ) {
    var args = {
      x = 0,
      y = 0
    };
    var direction = axis == "column" ? "down" : "right";
    var lineToRotate = axis == "column" ? "y" : "x";
    var axisToItterate = axis == "column" ? "x" : "y";
    var itemsInLine = axis == "column" ? gridSize[ 1 ] : gridSize[ 2 ];

    args[ lineToRotate ] = whichOne;

    var prevValues = [ ];

    for ( var position = 1; position <= itemsInLine; position++ ) {
      args[ axisToItterate ] = position;
      arrayAppend( prevValues, getPixel( argumentCollection = args ) );
    }

    var newValues = shift( prevValues, ticks );
    var i = 0;

    for ( var state in newValues ) {
      i++;
      args[ "state" ] = state;
      args[ axisToItterate ] = i;
      drawPixel( argumentCollection = args );
    }
  }

  function shift( values, places ) {
    var result = [ ];
    var numberOfItems = arrayLen( values );

    for ( var i = 1; i <= numberOfItems; i++ ) {
      var newValue = values[ i ];
      newPlace = places + i;

      if ( newPlace > numberOfItems ) {
        newPlace = newPlace - numberOfItems;
      }

      result[ newPlace ] = newValue;
    }

    return result;
  }

  function getPixel( x, y ) {
    return grid[ x ][ y ];
  }

  function printGrid( ) {
    var result = "";

    result &= '<pre>';
    for ( var row in grid ) {
      for ( var col in row ) {
        result &= col ? '##' : '.';
      }
      result &= '<br />';
    }
    result &= '</pre>';

    return result;
  }
}