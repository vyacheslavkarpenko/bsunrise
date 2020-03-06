FactoryBot.define do

  factory :chat, class: Chat do |c|
    c.text { 'factory_text' }
    c.user_id { nil }
    c.task_id { nil }
  end

  # factory :chat_for_task, parent: :chat do |c|
  #   c.text { 'factory_text' }
  #   c.user_id { create(:user).id }
  #   c.task_id { create(:task).id }
  # end
end
