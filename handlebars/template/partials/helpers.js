// Register Handlebars helpers for API template
module.exports = function (Handlebars) {
  Handlebars.registerHelper("methodPrefix", function (method) {
    switch (method) {
      case "get":
        return "get";
      case "post":
        return "create";
      case "put":
        return "update";
      case "delete":
        return "delete";
      default:
        return method;
    }
  });

  Handlebars.registerHelper("pascalCase", function (path) {
    return path
      .split("/")
      .map((part) => (part ? part.charAt(0).toUpperCase() + part.slice(1) : ""))
      .join("");
  });

  Handlebars.registerHelper("parameterList", function (operation) {
    const params = [];
    if (
      operation.parameters &&
      operation.parameters.some((p) => p.in === "path")
    ) {
      params.push("id: number");
    }
    if (operation.requestType) {
      if (params.length) params.push("data: " + operation.requestType);
      else params.push("data: " + operation.requestType);
    }
    return params.join(", ");
  });

  Handlebars.registerHelper("responseType", function (operation) {
    return operation.responseType || "any";
  });

  Handlebars.registerHelper("hasRequestBody", function (operation) {
    return !!operation.requestType;
  });

  Handlebars.registerHelper("formatUrl", function (path, operation) {
    if (
      operation.parameters &&
      operation.parameters.some((p) => p.in === "path")
    ) {
      return path.replace("{id}", "${id}");
    }
    return path;
  });
};
