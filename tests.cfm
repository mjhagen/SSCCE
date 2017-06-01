<cfscript>
function doSomething (
    required array a) {
    for (var ix = 1; ix < arrayLen(a); ix++) {
        a[ix].b += 1;
    }
}
a1 = [{
        a: {
            b: 1
        }
    },
    {
        a: {
            b: 2
        }
    },
    {
        a: {
            b: 3
        }
    }
];
a2 = [];
for (ix = 1; ix < arrayLen(a1); ix++) {
    arrayAppend(a2, a1[ix].a);
}
writeDump(a1);
doSomething(a2);
writeDump(a1);
</cfscript>