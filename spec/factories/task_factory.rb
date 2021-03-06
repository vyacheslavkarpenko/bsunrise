FactoryBot.define do

  factory :task, class: Task do |t|
    t.name { 'Task name' }
    t.description { 'Task description' }
    t.user_id { nil } 
    t.parent_task_id { nil }
  end
end
