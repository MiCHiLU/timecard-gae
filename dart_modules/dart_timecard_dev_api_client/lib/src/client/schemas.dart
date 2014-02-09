part of timecard_dev_api;

class MainApiV1MessageCommentReceive {

  core.String body;

  core.String issue;

  /** Create new MainApiV1MessageCommentReceive from JSON data */
  MainApiV1MessageCommentReceive.fromJson(core.Map json) {
    if (json.containsKey("body")) {
      body = json["body"];
    }
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentReceive */
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

  /** Return String representation of MainApiV1MessageCommentReceive */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentReceiveList {

  core.String issue;

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageCommentReceiveList from JSON data */
  MainApiV1MessageCommentReceiveList.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageCommentReceiveList */
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

  /** Return String representation of MainApiV1MessageCommentReceiveList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentReceiveUpdate {

  core.String body;

  core.String key;

  /** Create new MainApiV1MessageCommentReceiveUpdate from JSON data */
  MainApiV1MessageCommentReceiveUpdate.fromJson(core.Map json) {
    if (json.containsKey("body")) {
      body = json["body"];
    }
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentReceiveUpdate */
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

  /** Return String representation of MainApiV1MessageCommentReceiveUpdate */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentSend {

  core.String author;

  core.String author_name;

  core.String body;

  core.String issue;

  core.String key;

  core.int project;

  core.String time_at;

  core.String update_at;

  /** Create new MainApiV1MessageCommentSend from JSON data */
  MainApiV1MessageCommentSend.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageCommentSend */
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

  /** Return String representation of MainApiV1MessageCommentSend */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageCommentSendCollection {

  core.List<MainApiV1MessageCommentSend> items;

  core.String pagination;

  /** Create new MainApiV1MessageCommentSendCollection from JSON data */
  MainApiV1MessageCommentSendCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageCommentSend.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageCommentSendCollection */
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

  /** Return String representation of MainApiV1MessageCommentSendCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueReceive {

  core.String assignee;

  core.String description;

  core.String key;

  core.String subject;

  /** Create new MainApiV1MessageIssueReceive from JSON data */
  MainApiV1MessageIssueReceive.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageIssueReceive */
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

  /** Return String representation of MainApiV1MessageIssueReceive */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueReceiveList {

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageIssueReceiveList from JSON data */
  MainApiV1MessageIssueReceiveList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueReceiveList */
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

  /** Return String representation of MainApiV1MessageIssueReceiveList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueReceiveNew {

  core.String assignee;

  core.String description;

  core.int project;

  core.String subject;

  /** Create new MainApiV1MessageIssueReceiveNew from JSON data */
  MainApiV1MessageIssueReceiveNew.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageIssueReceiveNew */
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

  /** Return String representation of MainApiV1MessageIssueReceiveNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueReceiveSearch {

  core.String pagination;

  core.int project;

  core.String query;

  /** Create new MainApiV1MessageIssueReceiveSearch from JSON data */
  MainApiV1MessageIssueReceiveSearch.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageIssueReceiveSearch */
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

  /** Return String representation of MainApiV1MessageIssueReceiveSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueReceiveToggle {

  core.String key;

  /** Create new MainApiV1MessageIssueReceiveToggle from JSON data */
  MainApiV1MessageIssueReceiveToggle.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueReceiveToggle */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageIssueReceiveToggle */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueSend {

  core.String assignee;

  core.String author;

  core.String closed_on;

  core.String description;

  core.String key;

  core.int project;

  core.String subject;

  core.String will_start_at;

  /** Create new MainApiV1MessageIssueSend from JSON data */
  MainApiV1MessageIssueSend.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageIssueSend */
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

  /** Return String representation of MainApiV1MessageIssueSend */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageIssueSendCollection {

  core.List<MainApiV1MessageIssueSend> items;

  core.String pagination;

  /** Create new MainApiV1MessageIssueSendCollection from JSON data */
  MainApiV1MessageIssueSendCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageIssueSend.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageIssueSendCollection */
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

  /** Return String representation of MainApiV1MessageIssueSendCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectReceive {

  core.List<core.String> admin;

  core.bool closed;

  core.String description;

  core.bool is_public;

  core.int key;

  core.String language;

  core.List<core.String> member;

  core.String name;

  /** Create new MainApiV1MessageProjectReceive from JSON data */
  MainApiV1MessageProjectReceive.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageProjectReceive */
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

  /** Return String representation of MainApiV1MessageProjectReceive */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectReceiveDelete {

  core.int key;

  core.String name;

  /** Create new MainApiV1MessageProjectReceiveDelete from JSON data */
  MainApiV1MessageProjectReceiveDelete.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = (json["key"] is core.String) ? core.int.parse(json["key"]) : json["key"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectReceiveDelete */
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

  /** Return String representation of MainApiV1MessageProjectReceiveDelete */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectReceiveList {

  core.String pagination;

  /** Create new MainApiV1MessageProjectReceiveList from JSON data */
  MainApiV1MessageProjectReceiveList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectReceiveList */
  core.Map toJson() {
    var output = new core.Map();

    if (pagination != null) {
      output["pagination"] = pagination;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageProjectReceiveList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectReceiveNew {

  core.String description;

  core.bool is_public;

  core.String name;

  /** Create new MainApiV1MessageProjectReceiveNew from JSON data */
  MainApiV1MessageProjectReceiveNew.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageProjectReceiveNew */
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

  /** Return String representation of MainApiV1MessageProjectReceiveNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectReceiveSearch {

  core.String pagination;

  core.String query;

  /** Create new MainApiV1MessageProjectReceiveSearch from JSON data */
  MainApiV1MessageProjectReceiveSearch.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("query")) {
      query = json["query"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectReceiveSearch */
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

  /** Return String representation of MainApiV1MessageProjectReceiveSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectSend {

  core.List<core.String> admin;

  core.bool closed;

  core.String description;

  core.bool is_public;

  core.int key;

  core.String language;

  core.List<core.String> member;

  core.String name;

  /** Create new MainApiV1MessageProjectSend from JSON data */
  MainApiV1MessageProjectSend.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageProjectSend */
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

  /** Return String representation of MainApiV1MessageProjectSend */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageProjectSendCollection {

  core.List<MainApiV1MessageProjectSend> items;

  core.String pagination;

  /** Create new MainApiV1MessageProjectSendCollection from JSON data */
  MainApiV1MessageProjectSendCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageProjectSend.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageProjectSendCollection */
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

  /** Return String representation of MainApiV1MessageProjectSendCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserReceive {

  core.String language;

  core.String name;

  /** Create new MainApiV1MessageUserReceive from JSON data */
  MainApiV1MessageUserReceive.fromJson(core.Map json) {
    if (json.containsKey("language")) {
      language = json["language"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserReceive */
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

  /** Return String representation of MainApiV1MessageUserReceive */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserReceiveDelete {

  core.String key;

  core.String name;

  /** Create new MainApiV1MessageUserReceiveDelete from JSON data */
  MainApiV1MessageUserReceiveDelete.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserReceiveDelete */
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

  /** Return String representation of MainApiV1MessageUserReceiveDelete */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserReceiveList {

  core.String key;

  /** Create new MainApiV1MessageUserReceiveList from JSON data */
  MainApiV1MessageUserReceiveList.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserReceiveList */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserReceiveList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserReceiveListCollection {

  core.List<MainApiV1MessageUserReceiveList> items;

  /** Create new MainApiV1MessageUserReceiveListCollection from JSON data */
  MainApiV1MessageUserReceiveListCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageUserReceiveList.fromJson(itemsItem)).toList();
    }
  }

  /** Create JSON Object for MainApiV1MessageUserReceiveListCollection */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageUserReceiveListCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserReceiveSearch {

  core.String pagination;

  core.String query;

  /** Create new MainApiV1MessageUserReceiveSearch from JSON data */
  MainApiV1MessageUserReceiveSearch.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("query")) {
      query = json["query"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserReceiveSearch */
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

  /** Return String representation of MainApiV1MessageUserReceiveSearch */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserSend {

  core.String key;

  core.String language;

  core.String name;

  /** Create new MainApiV1MessageUserSend from JSON data */
  MainApiV1MessageUserSend.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageUserSend */
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

  /** Return String representation of MainApiV1MessageUserSend */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageUserSendCollection {

  core.List<MainApiV1MessageUserSend> items;

  core.String pagination;

  /** Create new MainApiV1MessageUserSendCollection from JSON data */
  MainApiV1MessageUserSendCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageUserSend.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageUserSendCollection */
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

  /** Return String representation of MainApiV1MessageUserSendCollection */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadReceiveClose {

  /** Create new MainApiV1MessageWorkLoadReceiveClose from JSON data */
  MainApiV1MessageWorkLoadReceiveClose.fromJson(core.Map json) {
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadReceiveClose */
  core.Map toJson() {
    var output = new core.Map();


    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadReceiveClose */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadReceiveList {

  core.String pagination;

  core.int project;

  /** Create new MainApiV1MessageWorkLoadReceiveList from JSON data */
  MainApiV1MessageWorkLoadReceiveList.fromJson(core.Map json) {
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
    if (json.containsKey("project")) {
      project = (json["project"] is core.String) ? core.int.parse(json["project"]) : json["project"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadReceiveList */
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

  /** Return String representation of MainApiV1MessageWorkLoadReceiveList */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadReceiveNew {

  core.String issue;

  /** Create new MainApiV1MessageWorkLoadReceiveNew from JSON data */
  MainApiV1MessageWorkLoadReceiveNew.fromJson(core.Map json) {
    if (json.containsKey("issue")) {
      issue = json["issue"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadReceiveNew */
  core.Map toJson() {
    var output = new core.Map();

    if (issue != null) {
      output["issue"] = issue;
    }

    return output;
  }

  /** Return String representation of MainApiV1MessageWorkLoadReceiveNew */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadSend {

  core.String end_at;

  core.String issue;

  core.String issue_subject;

  core.int project;

  core.String project_name;

  core.String start_at;

  core.String user;

  core.String user_name;

  /** Create new MainApiV1MessageWorkLoadSend from JSON data */
  MainApiV1MessageWorkLoadSend.fromJson(core.Map json) {
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

  /** Create JSON Object for MainApiV1MessageWorkLoadSend */
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

  /** Return String representation of MainApiV1MessageWorkLoadSend */
  core.String toString() => JSON.encode(this.toJson());

}

class MainApiV1MessageWorkLoadSendCollection {

  core.List<MainApiV1MessageWorkLoadSend> items;

  core.String pagination;

  /** Create new MainApiV1MessageWorkLoadSendCollection from JSON data */
  MainApiV1MessageWorkLoadSendCollection.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MainApiV1MessageWorkLoadSend.fromJson(itemsItem)).toList();
    }
    if (json.containsKey("pagination")) {
      pagination = json["pagination"];
    }
  }

  /** Create JSON Object for MainApiV1MessageWorkLoadSendCollection */
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

  /** Return String representation of MainApiV1MessageWorkLoadSendCollection */
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
