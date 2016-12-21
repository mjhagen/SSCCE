component accessors="true" {
  property expectedResult;
  property testData;

  function init( ) {
    variables.testData = "";
    variables.expectedResult = "something";

    include "input-data.cfm"; // sets testData

    return this;
  }

  function solve( ) {
    return "nothing-yet";
  }
}