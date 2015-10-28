component extends=framework.one {
  variables.framework.routes = [{
    "$RESOURCES" = { resources = "myObject", subsystem = "api" }
  }];
}