from protorpc import messages, message_types


class UserRequestNew(messages.Message):
  name        = messages.StringField (1, required=True)
  language    = messages.StringField (2, required=False)

class UserRequest(messages.Message):
  name        = messages.StringField (1, required=False)
  language    = messages.StringField (2, required=False)

class UserRequestDelete(messages.Message):
  key         = messages.StringField (1, required=True)
  name        = messages.StringField (2, required=True)

class UserResponse(messages.Message):
  key         = messages.StringField (1, required=True)
  name        = messages.StringField (2, required=True)
  language    = messages.StringField (3, required=True)

class UserResponseCollection(messages.Message):
  items       = messages.MessageField(UserResponse, 1, repeated=True)
  pagination  = messages.StringField (2, required=False)

class UserRequestList(messages.Message):
  key         = messages.StringField (1, required=True)

class UserRequestListCollection(messages.Message):
  items       = messages.MessageField(UserRequestList, 1, repeated=True)

class UserRequestSearch(messages.Message):
  query       = messages.StringField (1, required=True)
  pagination  = messages.StringField (2, required=False)


class ProjectRequestNew(messages.Message):
  name        = messages.StringField (1, required=True)
  description = messages.StringField (2, default="")
  is_public   = messages.BooleanField(3, default=True)

class ProjectRequestList(messages.Message):
  pagination  = messages.StringField (1, required=False)

class ProjectRequestSearch(messages.Message):
  query       = messages.StringField (1, required=True)
  pagination  = messages.StringField (2, required=False)

class ProjectRequest(messages.Message):
  key         = messages.IntegerField(1, required=True)
  name        = messages.StringField (2, required=False)
  description = messages.StringField (3, required=False)
  is_public   = messages.BooleanField(4, required=False)
  closed      = messages.BooleanField(5, required=False)
  admin       = messages.StringField (6, repeated=True)
  member      = messages.StringField (7, repeated=True)
  language    = messages.StringField (8, required=False)

class ProjectRequestDelete(messages.Message):
  key         = messages.IntegerField(1, required=True)
  name        = messages.StringField (2, required=True)

class ProjectResponse(messages.Message):
  key         = messages.IntegerField(1, required=True)
  name        = messages.StringField (2, required=True)
  description = messages.StringField (3, required=True)
  is_public   = messages.BooleanField(4, required=True)
  closed      = messages.BooleanField(5, required=True)
  admin       = messages.StringField (6, repeated=True)
  member      = messages.StringField (7, repeated=True)
  language    = messages.StringField (8, required=True)

class ProjectResponseCollection(messages.Message):
  items       = messages.MessageField(ProjectResponse, 1, repeated=True)
  pagination  = messages.StringField (3, required=False)


class IssueRequestNew(messages.Message):
  project       = messages.IntegerField      (1, required=True)
  subject       = messages.StringField       (2, required=True)
  description   = messages.StringField       (3, default="")
  assignee      = messages.StringField       (4, required=False)

class IssueRequestList(messages.Message):
  project       = messages.IntegerField      (1, required=True)
  pagination    = messages.StringField       (2, required=False)

class IssueRequestSearch(messages.Message):
  project       = messages.IntegerField      (1, required=True)
  query         = messages.StringField       (2, required=True)
  pagination    = messages.StringField       (3, required=False)

class IssueRequest(messages.Message):
  key           = messages.StringField       (1, required=True)
  subject       = messages.StringField       (2, required=False)
  description   = messages.StringField       (3, required=False)
  assignee      = messages.StringField       (4, required=False)

class IssueRequestToggle(messages.Message):
  key           = messages.StringField       (1, required=True)

class IssueResponse(messages.Message):
  project       = messages.IntegerField      (1, required=True)
  subject       = messages.StringField       (2, required=True)
  description   = messages.StringField       (3, required=True)
  assignee      = messages.StringField       (4, required=False)
  key           = messages.StringField       (5, required=True)
  closed_on     = message_types.DateTimeField(6, required=False)
  will_start_at = message_types.DateTimeField(7, required=True)
  author        = messages.StringField       (8, required=True)

class IssueResponseCollection(messages.Message):
  items         = messages.MessageField(IssueResponse, 1, repeated=True)
  pagination    = messages.StringField       (2, required=False)


class WorkLoadRequest(messages.Message):
  active        = messages.BooleanField      (1, required=False)

class WorkLoadRequestNew(messages.Message):
  issue         = messages.StringField       (1, required=True)

class WorkLoadRequestList(messages.Message):
  project       = messages.IntegerField      (1, required=True)
  pagination    = messages.StringField       (2, required=False)

class WorkLoadRequestClose(messages.Message):
  pass

class WorkLoadResponse(messages.Message):
  issue         = messages.StringField       (1, required=True)
  end_at        = message_types.DateTimeField(2, required=False)
  user          = messages.StringField       (3, required=True)
  project       = messages.IntegerField      (4, required=True)
  start_at      = message_types.DateTimeField(5, required=False)
  project_name  = messages.StringField       (6, required=True)
  issue_subject = messages.StringField       (7, required=True)
  user_name     = messages.StringField       (8, required=True)

class WorkLoadResponseCollection(messages.Message):
  items         = messages.MessageField(WorkLoadResponse, 1, repeated=True)
  pagination    = messages.StringField       (2, required=False)


class CommentRequest(messages.Message):
  issue         = messages.StringField       (1, required=True)
  body          = messages.StringField       (2, required=True)

class CommentRequestList(messages.Message):
  project       = messages.IntegerField      (1, required=False)
  issue         = messages.StringField       (2, required=False)
  pagination    = messages.StringField       (3, required=False)

class CommentRequestUpdate(messages.Message):
  body          = messages.StringField       (2, required=True)
  key           = messages.StringField       (3, required=True)

class CommentResponse(messages.Message):
  issue         = messages.StringField       (1, required=True)
  body          = messages.StringField       (2, required=True)
  key           = messages.StringField       (3, required=True)
  project       = messages.IntegerField      (4, required=True)
  time_at       = message_types.DateTimeField(5, required=True)
  author        = messages.StringField       (6, required=True)
  author_name   = messages.StringField       (7, required=True)
  update_at     = message_types.DateTimeField(8, required=False)

class CommentResponseCollection(messages.Message):
  items         = messages.MessageField(CommentResponse, 1, repeated=True)
  pagination    = messages.StringField       (2, required=False)
