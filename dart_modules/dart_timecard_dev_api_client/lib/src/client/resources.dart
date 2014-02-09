part of timecard_dev_api;

class CommentResource_ {

  final Client _client;

  CommentResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageCommentRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentResponse> create(MainApiV1MessageCommentRequest request, {core.Map optParams}) {
    var url = "comment/create";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageCommentResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageCommentRequestList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentResponseCollection> list(MainApiV1MessageCommentRequestList request, {core.Map optParams}) {
    var url = "comment/list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageCommentResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageCommentRequestUpdate to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentResponse> update(MainApiV1MessageCommentRequestUpdate request, {core.Map optParams}) {
    var url = "comment/update";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageCommentResponse.fromJson(data));
  }
}

class IssueResource_ {

  final Client _client;

  IssueResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageIssueRequestToggle to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponse> close(MainApiV1MessageIssueRequestToggle request, {core.Map optParams}) {
    var url = "issue/close";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueRequestNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponse> create(MainApiV1MessageIssueRequestNew request, {core.Map optParams}) {
    var url = "issue/create";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueRequestList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponseCollection> list(MainApiV1MessageIssueRequestList request, {core.Map optParams}) {
    var url = "issue/list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueRequestToggle to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponse> reopen(MainApiV1MessageIssueRequestToggle request, {core.Map optParams}) {
    var url = "issue/reopen";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueRequestSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponseCollection> search(MainApiV1MessageIssueRequestSearch request, {core.Map optParams}) {
    var url = "issue/search";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueResponse> update(MainApiV1MessageIssueRequest request, {core.Map optParams}) {
    var url = "issue/update";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageIssueResponse.fromJson(data));
  }
}

class MeResource_ {

  final Client _client;

  MeResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageUserRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponse> create(MainApiV1MessageUserRequest request, {core.Map optParams}) {
    var url = "me/create";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserRequestDelete to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(MainApiV1MessageUserRequestDelete request, {core.Map optParams}) {
    var url = "me/delete";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponse> get({core.Map optParams}) {
    var url = "me/get";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponse> patch(MainApiV1MessageUserRequest request, {core.Map optParams}) {
    var url = "me/update";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "PATCH", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponse> update(MainApiV1MessageUserRequest request, {core.Map optParams}) {
    var url = "me/update";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponse.fromJson(data));
  }
}

class ProjectResource_ {

  final Client _client;

  ProjectResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageProjectRequestNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectResponse> create(MainApiV1MessageProjectRequestNew request, {core.Map optParams}) {
    var url = "project/create";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageProjectResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectRequestDelete to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(MainApiV1MessageProjectRequestDelete request, {core.Map optParams}) {
    var url = "project/delete";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   *
   * [request] - MainApiV1MessageProjectRequestList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectResponseCollection> list(MainApiV1MessageProjectRequestList request, {core.Map optParams}) {
    var url = "project/list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageProjectResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectRequestSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectResponseCollection> search(MainApiV1MessageProjectRequestSearch request, {core.Map optParams}) {
    var url = "project/search";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageProjectResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectResponse> update(MainApiV1MessageProjectRequest request, {core.Map optParams}) {
    var url = "project/update";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageProjectResponse.fromJson(data));
  }
}

class UserResource_ {

  final Client _client;

  UserResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageUserRequestListCollection to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponseCollection> list(MainApiV1MessageUserRequestListCollection request, {core.Map optParams}) {
    var url = "user/list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponseCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserRequestSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserResponseCollection> search(MainApiV1MessageUserRequestSearch request, {core.Map optParams}) {
    var url = "user/search";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageUserResponseCollection.fromJson(data));
  }
}

class WorkloadResource_ {

  final Client _client;

  WorkloadResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageWorkLoadRequestNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadResponse> create(MainApiV1MessageWorkLoadRequestNew request, {core.Map optParams}) {
    var url = "workload/create";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageWorkLoadResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageWorkLoadRequestClose to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadResponse> finish(MainApiV1MessageWorkLoadRequestClose request, {core.Map optParams}) {
    var url = "workload/finish";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageWorkLoadResponse.fromJson(data));
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadResponse> get({core.Map optParams}) {
    var url = "workload/get";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageWorkLoadResponse.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageWorkLoadRequestList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadResponseCollection> list(MainApiV1MessageWorkLoadRequestList request, {core.Map optParams}) {
    var url = "workload/list";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new MainApiV1MessageWorkLoadResponseCollection.fromJson(data));
  }
}

