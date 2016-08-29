component accessors="true" {
  property expectedResult;
  property testData;

  include "includes/expected-result.cfm"; // sets expectedResult
  include "includes/source-data.cfm"; // sets testData

  function solve( ) {
    var parents = { "" = {} };

    for ( var row in testData ) {
      parents[ row.id ] = { "nodeText" = row.nodeText };

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
