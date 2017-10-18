class Task
  include Mongoid::Document
  field :task_name, type: String
  field :task_notes, type: String
end
