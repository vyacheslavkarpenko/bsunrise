class Chat
  include Mongoid::Document

  field :text, type: String

  belongs_to :task, dependent: :destroy
end
