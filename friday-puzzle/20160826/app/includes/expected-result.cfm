<cfset variables.expectedresult = [
  {
     nodeText : "File"
    ,children : [
      {
         nodeText : "New"
        ,children : [
           { nodeText: "File" }
          ,{ nodeText: "Folder" }
        ]
      }
    ]
  }
  ,{
     nodeText : "Edit"
    ,children : [
       {nodeText: "Copy"}
      ,{nodeText: "Cut"}
      ,{nodeText: "Paste"}
    ]
  }
  ,{
     nodeText : "Help"
    ,children : [
      { nodeText: "About" }
    ]
  }
] />