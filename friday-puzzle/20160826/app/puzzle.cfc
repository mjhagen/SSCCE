component accessors="true" {
  property expectedResult;
  property testData;

  include "includes/expected-result.cfm"; // sets expectedResult
  include "includes/source-data.cfm"; // sets testData

  function solve( ) {
    var parent = 0;
    var pointers = { "" = {} };

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

  function sanityCheck( ) {
    return expectedresult;
  }
}