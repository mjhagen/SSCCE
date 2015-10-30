component accessors=true {
  property worksService;
  property breakstuffService;

  public main function init( required struct fw ) {
    variables.fw = fw;
    return this;
  }

  public void function default() {
    rc.test = worksService.test();
  }

  public void function exception() {
    rc.test = breakstuffService.test();
  }
}