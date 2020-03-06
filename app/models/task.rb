class Task
  include Mongoid::Document
  field :name,            type: String
  field :description,     type: String 
  field :user_id,         type: BSON::ObjectId
  field :parent_task_id,  type: BSON::ObjectId, default: nil

  belongs_to :user
  has_many :chats
end
