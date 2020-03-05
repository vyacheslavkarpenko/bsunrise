FactoryBot.define do

  factory :chat, class: Chat do |c|
    c.text { 'factory_text' }
    c.user_id { '1' }
    c.task_id { '2' }
  end
end
