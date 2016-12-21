component accessors="true" {
  property expectedResult;
  property testData;

  function init() {
    variables.testData = "";
    variables.expectedResult = 288;

    include "input-data.cfm"; // sets testData

    variables.facing = "N";
    variables.cursor = position( );
    variables.instructions = {
      N = { R = { axis = "X", multiplier =  1, facing="E" }, L = { axis = "X", multiplier = -1, facing="W" } },
      S = { R = { axis = "X", multiplier = -1, facing="W" }, L = { axis = "X", multiplier =  1, facing="E" } },
      E = { R = { axis = "Y", multiplier = -1, facing="S" }, L = { axis = "Y", multiplier =  1, facing="N" } },
      W = { R = { axis = "Y", multiplier =  1, facing="N" }, L = { axis = "Y", multiplier = -1, facing="S" } }
    };

    return this;
  }

  function solve( ) {
    return distanceFromStart( );
  }

  function distanceFromStart( ) {
    var path = listToArray( testData, ", " );

    for( var directions in path ) {
      move( directions );
    }

    return abs( cursor[ 1 ] ) + abs( cursor[ 2 ] );
  }

  function move( directions ) {
    var turn = left( directions, 1 );
    var steps = mid( directions, 2, len( directions ) );
    var instruction = instructions[ facing ][ turn ];

    var args = {
      x = cursor[ 1 ],
      y = cursor[ 2 ]
    };

    args[ instruction.axis ] += ( instruction.multiplier * steps );

    variables.cursor = position( argumentCollection = args );
    variables.facing = instruction.facing;

    return cursor;
  }

  function position( x = 0, y = 0 ) {
    return [ x, y ];
  }
}