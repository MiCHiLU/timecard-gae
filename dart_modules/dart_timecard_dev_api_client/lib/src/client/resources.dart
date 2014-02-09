part of timecard_dev_api;

class CommentResource_ {

  final Client _client;

  CommentResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageCommentReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentSend> create(MainApiV1MessageCommentReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageCommentSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageCommentReceiveList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentSendCollection> list(MainApiV1MessageCommentReceiveList request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageCommentSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageCommentReceiveUpdate to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageCommentSend> update(MainApiV1MessageCommentReceiveUpdate request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageCommentSend.fromJson(data));
  }
}

class IssueResource_ {

  final Client _client;

  IssueResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageIssueReceiveToggle to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSend> close(MainApiV1MessageIssueReceiveToggle request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueReceiveNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSend> create(MainApiV1MessageIssueReceiveNew request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueReceiveList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSendCollection> list(MainApiV1MessageIssueReceiveList request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueReceiveToggle to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSend> reopen(MainApiV1MessageIssueReceiveToggle request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueReceiveSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSendCollection> search(MainApiV1MessageIssueReceiveSearch request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageIssueReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageIssueSend> update(MainApiV1MessageIssueReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageIssueSend.fromJson(data));
  }
}

class MeResource_ {

  final Client _client;

  MeResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageUserReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserSend> create(MainApiV1MessageUserReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserReceiveDelete to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(MainApiV1MessageUserReceiveDelete request, {core.Map optParams}) {
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
  async.Future<MainApiV1MessageUserSend> get({core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserSend> patch(MainApiV1MessageUserReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserSend> update(MainApiV1MessageUserReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSend.fromJson(data));
  }
}

class ProjectResource_ {

  final Client _client;

  ProjectResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageProjectReceiveNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectSend> create(MainApiV1MessageProjectReceiveNew request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageProjectSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectReceiveDelete to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(MainApiV1MessageProjectReceiveDelete request, {core.Map optParams}) {
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
   * [request] - MainApiV1MessageProjectReceiveList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectSendCollection> list(MainApiV1MessageProjectReceiveList request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageProjectSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectReceiveSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectSendCollection> search(MainApiV1MessageProjectReceiveSearch request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageProjectSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageProjectReceive to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageProjectSend> update(MainApiV1MessageProjectReceive request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageProjectSend.fromJson(data));
  }
}

class UserResource_ {

  final Client _client;

  UserResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageUserReceiveListCollection to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserSendCollection> list(MainApiV1MessageUserReceiveListCollection request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSendCollection.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageUserReceiveSearch to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageUserSendCollection> search(MainApiV1MessageUserReceiveSearch request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageUserSendCollection.fromJson(data));
  }
}

class WorkloadResource_ {

  final Client _client;

  WorkloadResource_(Client client) :
      _client = client;

  /**
   *
   * [request] - MainApiV1MessageWorkLoadReceiveNew to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadSend> create(MainApiV1MessageWorkLoadReceiveNew request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageWorkLoadSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageWorkLoadReceiveClose to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadSend> finish(MainApiV1MessageWorkLoadReceiveClose request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageWorkLoadSend.fromJson(data));
  }

  /**
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadSend> get({core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageWorkLoadSend.fromJson(data));
  }

  /**
   *
   * [request] - MainApiV1MessageWorkLoadReceiveList to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<MainApiV1MessageWorkLoadSendCollection> list(MainApiV1MessageWorkLoadReceiveList request, {core.Map optParams}) {
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
      .then((data) => new MainApiV1MessageWorkLoadSendCollection.fromJson(data));
  }
}

