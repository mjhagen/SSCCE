component extends=cfroot.abstractPuzzle accessors="true" {
  property expectedResult;
  property testData;

  include "includes/expected-result.cfm"; // sets expectedResult
  include "includes/source-data.cfm"; // sets testData

  function solve( ) {
    var parents = { "" = { } };

    for ( var row in testData ) {
      parents[ row.id ] = { "nodeText" = row.nodeText };

      var parent = parents[ row.parentId ];

      param parent.children=[ ];
      parent.children.append( parents[ row.id ] );
    }

    return parents[ "" ].children;
  }

  function solveJp( ) {
    var result = [ ];
    var memory = { };

    for ( var child in testData ) {
      memory[ child.id ] = { 'nodeText': child.nodeText };

      if ( child.parentID.len() ) {
        if ( !memory[ child.parentID ].keyExists( 'children' ) ) {
          memory[ child.parentID ][ 'children' ] = [ ];
        }

        memory[ child.parentID ][ 'children' ].append( memory[ child.id ] );
      } else {
        result.append( memory[ child.id ] );
      }
    }

    return result;
  }

  function sanityCheck( ) {
    return expectedresult;
  }
}