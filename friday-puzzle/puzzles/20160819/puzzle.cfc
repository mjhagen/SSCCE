component extends=cfroot.abstractPuzzle {
  function run() {
    var sourceFile = fileRead( expandPath( "/cfroot/puzzles/20160819/source-data.php" ) );
    var phpDataTypes = {
      "a" = "array",
      "b" = "boolean",
      "d" = "double",
      "i" = "integer",
      "N" = "null",
      "s" = "string",
      "S" = "string",
      "U" = "string"
    };
  }
}