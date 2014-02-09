part of timecard_dev_api;

class MainApiV1MessageCommentRequest {

  core.String body;

  core.String issue;

  /** Create new MainApiV1MessageCommentRequest from JSON data */
  MainApiV1MessageCommentRequest.fromJson(core.Map json) {
    if (json.containsKey("body")) {
      body = json["body"];
    }
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (body != null) {
      output["body"] = body;
    }
    if (issue != null) {
      output["issue"] = issue;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageCommentRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentRequestList {

  core.String issue;

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageCommentRequestList from JSON data */
  MainApiV1MessageCommentRequestList.fromJson(core.Map json) {
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentRequestList */
  core.Map toJson() {
    var output = new core.Map();

    if (issue != null) {
      output["issue"] = issue;
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (project != null) {
      output["project"] = project;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageCommentRequestList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentRequestUpdate {

  core.String body;

  core.String key;

  /** Create new MainApiV1MessageCommentRequestUpdate from JSON data */
  MainApiV1MessageCommentRequestUpdate.fromJson(core.Map json) {
    if (json.containsKey("body")) {
      body = json["body"];
    }
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentRequestUpdate */
  core.Map toJson() {
    var output = new core.Map();

    if (body != null) {
      output["body"] = body;
    }
    if (key != null) {
      output["key"] = key;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageCommentRequestUpdate */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentResponse {

  core.String author;

  core.String author_name;

  core.String body;

  core.String issue;

  core.String key;

  core.int project;

  core.String time_at;

  core.String update_at;

  /** Create new MainApiV1MessageCommentResponse from JSON data */
  MainApiV1MessageCommentResponse.fromJson(core.Map json) {
    if (json.containsKey("author")) {
      author = json["author"];
    }
    if (json.containsKey("author_name")) {
      author_name = json["author_name"];
    }
    if (json.containsKey("body")) {
      body = json["body"];
    }
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
    if (json.containsKey("time_at")) {
      time_at = json["time_at"];
    }
    if (json.containsKey("update_at")) {
      update_at = json["update_at"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (author != null) {
      output["author"] = author;
    }
    if (author_name != null) {
      output["author_name"] = author_name;
    }
    if (body != null) {
      output["body"] = body;
    }
    if (issue != null) {
      output["issue"] = issue;
    }
    if (key != null) {
      output["key"] = key;
    }
    if (project != null) {
      output["project"] = project;
    }
    if (time_at != null) {
      output["time_at"] = time_at;
    }
    if (update_at != null) {
      output["update_at"] = update_at;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageCommentResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentResponseCollection {

  core.List<MainApiV1MessageCommentResponse> items;

  core.String pagination;

  /** Create new MainApiV1MessageCommentResponseCollection from JSON data */
  MainApiV1MessageCommentResponseCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageCommentResponse.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentResponseCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageCommentResponseCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueRequest {

  core.String assignee;

  core.String description;

  core.String key;

  core.String subject;

  /** Create new MainApiV1MessageIssueRequest from JSON data */
  MainApiV1MessageIssueRequest.fromJson(core.Map json) {
    if (json.containsKey("assignee")) {
      assignee = json["assignee"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("subject")) {
      subject = json["subject"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (assignee != null) {
      output["assignee"] = assignee;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (key != null) {
      output["key"] = key;
    }
    if (subject != null) {
      output["subject"] = subject;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueRequestList {

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageIssueRequestList from JSON data */
  MainApiV1MessageIssueRequestList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueRequestList */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (project != null) {
      output["project"] = project;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueRequestList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueRequestNew {

  core.String assignee;

  core.String description;

  core.int project;

  core.String subject;

  /** Create new MainApiV1MessageIssueRequestNew from JSON data */
  MainApiV1MessageIssueRequestNew.fromJson(core.Map json) {
    if (json.containsKey("assignee")) {
      assignee = json["assignee"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
    if (json.containsKey("subject")) {
      subject = json["subject"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueRequestNew */
  core.Map toJson() {
    var output = new core.Map();

    if (assignee != null) {
      output["assignee"] = assignee;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (project != null) {
      output["project"] = project;
    }
    if (subject != null) {
      output["subject"] = subject;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueRequestNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueRequestSearch {

  core.String pagination;

  core.int project;

  core.String query;

  /** Create new MainApiV1MessageIssueRequestSearch from JSON data */
  MainApiV1MessageIssueRequestSearch.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
    if (json.containsKey("query")) {
      query = json["query"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueRequestSearch */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (project != null) {
      output["project"] = project;
    }
    if (query != null) {
      output["query"] = query;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueRequestSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueRequestToggle {

  core.String key;

  /** Create new MainApiV1MessageIssueRequestToggle from JSON data */
  MainApiV1MessageIssueRequestToggle.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueRequestToggle */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueRequestToggle */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueResponse {

  core.String assignee;

  core.String author;

  core.String closed_on;

  core.String description;

  core.String key;

  core.int project;

  core.String subject;

  core.String will_start_at;

  /** Create new MainApiV1MessageIssueResponse from JSON data */
  MainApiV1MessageIssueResponse.fromJson(core.Map json) {
    if (json.containsKey("assignee")) {
      assignee = json["assignee"];
    }
    if (json.containsKey("author")) {
      author = json["author"];
    }
    if (json.containsKey("closed_on")) {
      closed_on = json["closed_on"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
    if (json.containsKey("subject")) {
      subject = json["subject"];
    }
    if (json.containsKey("will_start_at")) {
      will_start_at = json["will_start_at"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (assignee != null) {
      output["assignee"] = assignee;
    }
    if (author != null) {
      output["author"] = author;
    }
    if (closed_on != null) {
      output["closed_on"] = closed_on;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (key != null) {
      output["key"] = key;
    }
    if (project != null) {
      output["project"] = project;
    }
    if (subject != null) {
      output["subject"] = subject;
    }
    if (will_start_at != null) {
      output["will_start_at"] = will_start_at;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueResponseCollection {

  core.List<MainApiV1MessageIssueResponse> items;

  core.String pagination;

  /** Create new MainApiV1MessageIssueResponseCollection from JSON data */
  MainApiV1MessageIssueResponseCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageIssueResponse.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueResponseCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueResponseCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectRequest {

  core.List<core.String> admin;

  core.bool closed;

  core.String description;

  core.bool is_public;

  core.int key;

  core.String language;

  core.List<core.String> member;

  core.String name;

  /** Create new MainApiV1MessageProjectRequest from JSON data */
  MainApiV1MessageProjectRequest.fromJson(core.Map json) {
    if (json.containsKey("admin")) {
      admin = json["admin"].toList();
    }
    if (json.containsKey("closed")) {
      closed = json["closed"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("is_public")) {
      is_public = json["is_public"];
    }
    if (json.containsKey("key")) {
      key = (json["key"] is core.String) ? core.int.parse(json["key"]) : json["key"];
    }
    if (json.containsKey("language")) {
      language = json["language"];
    }
    if (json.containsKey("member")) {
      member = json["member"].toList();
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (admin != null) {
      output["admin"] = admin.toList();
    }
    if (closed != null) {
      output["closed"] = closed;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (is_public != null) {
      output["is_public"] = is_public;
    }
    if (key != null) {
      output["key"] = key;
    }
    if (language != null) {
      output["language"] = language;
    }
    if (member != null) {
      output["member"] = member.toList();
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectRequestDelete {

  core.int key;

  core.String name;

  /** Create new MainApiV1MessageProjectRequestDelete from JSON data */
  MainApiV1MessageProjectRequestDelete.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = (json["key"] is core.String) ? core.int.parse(json["key"]) : json["key"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectRequestDelete */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectRequestDelete */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectRequestList {

  core.String pagination;

  /** Create new MainApiV1MessageProjectRequestList from JSON data */
  MainApiV1MessageProjectRequestList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectRequestList */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectRequestList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectRequestNew {

  core.String description;

  core.bool is_public;

  core.String name;

  /** Create new MainApiV1MessageProjectRequestNew from JSON data */
  MainApiV1MessageProjectRequestNew.fromJson(core.Map json) {
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("is_public")) {
      is_public = json["is_public"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectRequestNew */
  core.Map toJson() {
    var output = new core.Map();

    if (description != null) {
      output["description"] = description;
    }
    if (is_public != null) {
      output["is_public"] = is_public;
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectRequestNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectRequestSearch {

  core.String pagination;

  core.String query;

  /** Create new MainApiV1MessageProjectRequestSearch from JSON data */
  MainApiV1MessageProjectRequestSearch.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("query")) {
      query = json["query"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectRequestSearch */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (query != null) {
      output["query"] = query;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectRequestSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectResponse {

  core.List<core.String> admin;

  core.bool closed;

  core.String description;

  core.bool is_public;

  core.int key;

  core.String language;

  core.List<core.String> member;

  core.String name;

  /** Create new MainApiV1MessageProjectResponse from JSON data */
  MainApiV1MessageProjectResponse.fromJson(core.Map json) {
    if (json.containsKey("admin")) {
      admin = json["admin"].toList();
    }
    if (json.containsKey("closed")) {
      closed = json["closed"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("is_public")) {
      is_public = json["is_public"];
    }
    if (json.containsKey("key")) {
      key = (json["key"] is core.String) ? core.int.parse(json["key"]) : json["key"];
    }
    if (json.containsKey("language")) {
      language = json["language"];
    }
    if (json.containsKey("member")) {
      member = json["member"].toList();
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (admin != null) {
      output["admin"] = admin.toList();
    }
    if (closed != null) {
      output["closed"] = closed;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (is_public != null) {
      output["is_public"] = is_public;
    }
    if (key != null) {
      output["key"] = key;
    }
    if (language != null) {
      output["language"] = language;
    }
    if (member != null) {
      output["member"] = member.toList();
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectResponseCollection {

  core.List<MainApiV1MessageProjectResponse> items;

  core.String pagination;

  /** Create new MainApiV1MessageProjectResponseCollection from JSON data */
  MainApiV1MessageProjectResponseCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageProjectResponse.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectResponseCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectResponseCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserRequest {

  core.String language;

  core.String name;

  /** Create new MainApiV1MessageUserRequest from JSON data */
  MainApiV1MessageUserRequest.fromJson(core.Map json) {
    if (json.containsKey("language")) {
      language = json["language"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (language != null) {
      output["language"] = language;
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserRequestDelete {

  core.String key;

  core.String name;

  /** Create new MainApiV1MessageUserRequestDelete from JSON data */
  MainApiV1MessageUserRequestDelete.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserRequestDelete */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserRequestDelete */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserRequestList {

  core.String key;

  /** Create new MainApiV1MessageUserRequestList from JSON data */
  MainApiV1MessageUserRequestList.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserRequestList */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserRequestList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserRequestListCollection {

  core.List<MainApiV1MessageUserRequestList> items;

  /** Create new MainApiV1MessageUserRequestListCollection from JSON data */
  MainApiV1MessageUserRequestListCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageUserRequestList.fromJson(itemsItem)).toList();
    }
  }

  /** Create JSON Object for MainApiV1MessageUserRequestListCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserRequestListCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserRequestSearch {

  core.String pagination;

  core.String query;

  /** Create new MainApiV1MessageUserRequestSearch from JSON data */
  MainApiV1MessageUserRequestSearch.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("query")) {
      query = json["query"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserRequestSearch */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (query != null) {
      output["query"] = query;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserRequestSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserResponse {

  core.String key;

  core.String language;

  core.String name;

  /** Create new MainApiV1MessageUserResponse from JSON data */
  MainApiV1MessageUserResponse.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("language")) {
      language = json["language"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }
    if (language != null) {
      output["language"] = language;
    }
    if (name != null) {
      output["name"] = name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserResponseCollection {

  core.List<MainApiV1MessageUserResponse> items;

  core.String pagination;

  /** Create new MainApiV1MessageUserResponseCollection from JSON data */
  MainApiV1MessageUserResponseCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageUserResponse.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserResponseCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserResponseCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadRequestClose {

  /** Create new MainApiV1MessageWorkLoadRequestClose from JSON data */
  MainApiV1MessageWorkLoadRequestClose.fromJson(core.Map json) {
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadRequestClose */
  core.Map toJson() {
    var output = new core.Map();


    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadRequestClose */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadRequestList {

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageWorkLoadRequestList from JSON data */
  MainApiV1MessageWorkLoadRequestList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadRequestList */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }
    if (project != null) {
      output["project"] = project;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadRequestList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadRequestNew {

  core.String issue;

  /** Create new MainApiV1MessageWorkLoadRequestNew from JSON data */
  MainApiV1MessageWorkLoadRequestNew.fromJson(core.Map json) {
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadRequestNew */
  core.Map toJson() {
    var output = new core.Map();

    if (issue != null) {
      output["issue"] = issue;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadRequestNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadResponse {

  core.String end_at;

  core.String issue;

  core.String issue_subject;

  core.int project;

  core.String project_name;

  core.String start_at;

  core.String user;

  core.String user_name;

  /** Create new MainApiV1MessageWorkLoadResponse from JSON data */
  MainApiV1MessageWorkLoadResponse.fromJson(core.Map json) {
    if (json.containsKey("end_at")) {
      end_at = json["end_at"];
    }
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
    if (json.containsKey("issue_subject")) {
      issue_subject = json["issue_subject"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
    if (json.containsKey("project_name")) {
      project_name = json["project_name"];
    }
    if (json.containsKey("start_at")) {
      start_at = json["start_at"];
    }
    if (json.containsKey("user")) {
      user = json["user"];
    }
    if (json.containsKey("user_name")) {
      user_name = json["user_name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (end_at != null) {
      output["end_at"] = end_at;
    }
    if (issue != null) {
      output["issue"] = issue;
    }
    if (issue_subject != null) {
      output["issue_subject"] = issue_subject;
    }
    if (project != null) {
      output["project"] = project;
    }
    if (project_name != null) {
      output["project_name"] = project_name;
    }
    if (start_at != null) {
      output["start_at"] = start_at;
    }
    if (user != null) {
      output["user"] = user;
    }
    if (user_name != null) {
      output["user_name"] = user_name;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadResponse */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadResponseCollection {

  core.List<MainApiV1MessageWorkLoadResponse> items;

  core.String pagination;

  /** Create new MainApiV1MessageWorkLoadResponseCollection from JSON data */
  MainApiV1MessageWorkLoadResponseCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageWorkLoadResponse.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadResponseCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }
    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadResponseCollection */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
