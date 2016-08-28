component {
  this.name = "adam-quiz";

  /*
    - You have an array of strings, eg: ['a', 'at', 'cat', 'scat', 'catch'].
    - Return the first value that matches a regex pattern, eg: '.+at' would match cat, scat, catch; but we want cat returned.
    - Do not use any looping statements (eg: do/for/while etc).
    - Bear in mind functions are not statements ;-)
    - The array could be very long, the strings could be very long, and the pattern could be complex. But the desired value could be early in the array.
    - Use any language.
  */

  ArrayUtils = createObject( "java", "org.apache.commons.lang.ArrayUtils" );

  writeDump(ArrayUtils);abort;


arrayOfStrings = [ 'a', 'at', 'cat', 'scat', 'catch' ];
regex = '.+at';

writeOutput( arrayOfStrings.reduce( function( result="", item ){ return len( result ) ? result : item.reFind( regex ) ? item : ""; } ) );
}