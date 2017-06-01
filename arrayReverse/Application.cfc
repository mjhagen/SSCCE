<cfscript>
t = getTickCount();
down = ["wha", "toru", "rua", "tahi"];
up = down.reduce(function(a, v){
    a.prepend(v);
    return a;
}, []);

writeDump(up);
writeOutput('<br>#getTickCount()-t#ms.');

t = getTickCount();

down = ["wha", "toru", "rua", "tahi"];
function arrayReverse(validData){
  var len = arrayLen( validData );
  for(var i = 1; i <= len / 2; i++)
  {
      var temp = validData[i];
      validData[i] = validData[len - i - 1];
      validData[len - i - 1] = temp;
  }
  return validData;
}

writeDump(arrayReverse(down));
writeOutput('<br>#getTickCount()-t#ms.');

</cfscript>