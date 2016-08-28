component extends=cfroot.abstractPuzzle accessors="true" {
  property expectedResult;
  property testData;

  include "includes/expected-result.cfm"; // sets expectedResult
  include "includes/source-data.cfm"; // sets testData

  function solve( ) {
    var parent = 0;
    var pointers = { "" = { } };

    for ( row in testData ) {
      pointers[ row.id ] = row;

      parent = pointers[ row.parentId ];

      param parent.children=[ ];

      structDelete( row, "id" );
      structDelete( row, "parentId" );

      arrayAppend( parent.children, row );
    }

    return pointers[ "" ].children;
  }

  function lessHackyVersion( ) {
    var parents = { "" = {} };

    for ( row in testData ) {
      parents[ row.id ] = {
        nodeText = row.nodeText
      };

      var parent = parents[ row.parentId ];

      param parent.children=[ ];
      parent.children.append( parents[ row.id ] );
    }

    return parents[ "" ].children;
  }

  function worksWithOutOfOrder( ) {
    var parents = { "" = { } };

    for ( var row in testData ) {
      parents[ row.id ] = { nodeText = row.nodeText };
    }

    for ( var row in testData ) {
      var parent = parents[ row.parentId ];
      param parent.children=[ ];
      parent.children.append( parents[ row.id ] );
    }

    return parents[ "" ].children;
  }

  function sanityCheck( ) {
    return expectedresult;
  }
}