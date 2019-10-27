class Task
  include Mongoid::Document
  field :name,        type: String
  field :description, type: String 
  field :parent_task,  type: BSON::ObjectId, default: nil
  belongs_to :user
end
