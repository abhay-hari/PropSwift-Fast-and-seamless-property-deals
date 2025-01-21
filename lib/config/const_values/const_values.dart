class ConstValues {
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  static const appName = "";
}

class UrlEndPoints {
  static const todosApiEndpoint = "/todos";
}

class ApiUrls {
  static const jsonPlaceHolderTodos =
      "${ConstValues.baseUrl}${UrlEndPoints.todosApiEndpoint}";
}
