component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "278221";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    var rooms = convertInputToArray();
    var validRoomIds = [];

    for( var room in rooms ) {
      if( makeChecksum( room.encryptedName ) == room.checksum ) {
        arrayAppend( validRoomIds, room.sectorId );
      }
    }

    return arraySum( validRoomIds );
  }

  function makeChecksum( encryptedName ) {
    var letterCounter = { };
    var allLetters = listToArray( encryptedName, "" );

    for ( var letter in allLetters ) {
      if ( !structKeyExists( letterCounter, letter ) ) {
        letterCounter[ letter ] = 0;
      }
      letterCounter[ letter ]++;
    }

    var counterBins = {};

    for( var countedLetter in letterCounter ) {
      var binNumber = letterCounter[ countedLetter ];
      if( !structKeyExists( counterBins, binNumber ) ) {
        counterBins[ binNumber ] = [];
      }
      arrayAppend( counterBins[ binNumber ], countedLetter );
    }

    var sortedBinNumbers = structKeyArray( counterBins );
    arraySort( sortedBinNumbers, "numeric", "desc" );

    var checksum = "";

    for( var binNumber in sortedBinNumbers ) {
      arraySort( counterBins[ binNumber ], "text" );
      for( var letter in counterBins[ binNumber ] ) {
        checksum &= letter;

        if( len( checksum ) == 5 ) {
          return checksum;
        }
      }
    }

    return "";
  }

  function convertInputToArray() {
    var result = [];
    var testDataAsArray = listToArray( testData, chr( 13 ) & chr( 10 ) );

    for( var room in testDataAsArray ) {
      var decodedRoom = reFind( '([^\d]+)(\d+)\[([^\]]+)\]', room, 1, true );

      arrayAppend( result, {
        encryptedName = replace( decodedRoom.match[ 2 ], "-", "", "all" ),
        sectorId = decodedRoom.match[ 3 ],
        checksum = decodedRoom.match[ 4 ]
      } );
    }

    return result;
  }
}