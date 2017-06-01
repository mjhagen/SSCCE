<cfscript>

writeDump(doFoo());
writeDump(doBar());

function doFoo() {
    function doBar() {
    return true;
  }
  return doBar();
}

function doBar() {
    return false;
}
</cfscript>