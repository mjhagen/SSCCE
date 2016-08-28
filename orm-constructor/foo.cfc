component persistent=true {
  property int id;
  property string name;

  public component function init( required string test ) {
    variables.name = test;
    return this;
  }
}