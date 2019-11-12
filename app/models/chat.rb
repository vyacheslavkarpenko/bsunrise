class Chat
  include Mongoid::Document

  field :text,    type: String
  field :user_id, type: BSON::ObjectId
  field :task_id, type: BSON::ObjectId

  belongs_to :task, dependent: :destroy
end
