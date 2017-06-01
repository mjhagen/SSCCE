component accessors="true" {
  property expectedResult;
  property testData;

  function init() {
    variables.testData = "";
    variables.expectedResult = 288;

    include "input-data.cfm"; // sets testData

    variables.facing = "N";
    variables.touched = {};
    variables.intersection = [];
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
    followDirections();
    return distanceToDestination( cursor );
  }

  function solvePartTwo( ) {
    followDirections();
    return distanceToFirstIntersection( );
  }

  function distanceToDestination( pointer ) {
    return abs( pointer[ 1 ] ) + abs( pointer[ 2 ] );
  }

  function distanceToFirstIntersection( ) {
    if( arrayLen( intersection ) ) {
      return distanceToDestination( intersection[ 1 ] );
    }

    return 0;
  }

  function followDirections( ) {
    var path = listToArray( testData, ", " );

    for( var directions in path ) {
      move( directions );
    }
  }

  function move( directions ) {
    var turn = left( directions, 1 );
    var steps = mid( directions, 2, len( directions ) );
    var instruction = instructions[ facing ][ turn ];

    variables.facing = instruction.facing;

    var args = {
      X = cursor[ 1 ],
      Y = cursor[ 2 ]
    };

    args[ instruction.axis ] += ( instruction.multiplier * steps );

    var prevPos = duplicate( cursor );
    variables.cursor = position( argumentCollection = args );
    addTween( prevPos, cursor, instruction.axis );

    return cursor;
  }

  function position( X = 0, Y = 0 ) {
    return [ X, Y ];
  }

  function addTween( prevPosition, newPosition, axis ) {
    var arrIndex = axis == 'X' ? 1 : 2;
    var args = {
      X = prevPosition[ 1 ],
      Y = prevPosition[ 2 ]
    };

    if( newPosition[ arrIndex ] > prevPosition[ arrIndex ] ) {
      for ( var i = prevPosition[ arrIndex ] + 1; i <= newPosition[ arrIndex ]; i++ ) {
        args[ axis ] = i;
        var tween = position( argumentCollection = args );
        var key = arrayToList( tween, 'x' );
        if( structKeyExists( touched, key ) ) {
          arrayAppend( variables.intersection, tween );
        }
        variables.touched[ key ] = 1;
      }
    } else {
      for ( var i = prevPosition[ arrIndex ] - 1; i >= newPosition[ arrIndex ]; i-- ) {
        args[ axis ] = i;
        var tween = position( argumentCollection = args );
        var key = arrayToList( tween, 'x' );
        if( structKeyExists( touched, key ) ) {
          arrayAppend( variables.intersection, tween );
        }
        variables.touched[ key ] = 1;
      }
    }

    return touched;
  }
}