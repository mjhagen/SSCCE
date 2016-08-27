<cfscript>

  variables.TestData = querynew("id,parentId,nodeText");
  queryAddRow(TestData,{id:1,nodeText:"File" });
  queryAddRow(TestData,{id:2,nodeText:"New",parentId:1});
  queryAddRow(TestData,{id:3,nodeText:"File",parentId:2});
  queryAddRow(TestData,{id:4,nodeText:"Folder",parentId:2});
  queryAddRow(TestData,{id:5,nodeText:"Edit"});
  queryAddRow(TestData,{id:6,nodeText:"Copy",parentId:5});
  queryAddRow(TestData,{id:7,nodeText:"Cut",parentId:5});
  queryAddRow(TestData,{id:8,nodeText:"Paste",parentId:5});
  queryAddRow(TestData,{id:9,nodeText:"Help"});
  queryAddRow(TestData,{id:10,nodeText:"About",parentId:9});
</cfscript>