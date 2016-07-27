component {
  function init() {
    variables.basecfc = new basecfc.base();
  }

  function save( formData ) {
    return basecfc.save( formData );
  }
}