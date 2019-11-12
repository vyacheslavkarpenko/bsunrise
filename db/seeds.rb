# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# field :user_id, :type => BSON::ObjectId
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'slava@gmail.com', password: '123456')
user.save!

task = user.tasks.new(
  name: 'Task 1',
  description: 'Task 1 descripton 1',
  user_id: user.id.to_s,
  parent_task_id: nil
)
task.save!

task1_1 = user.tasks.new(
  name: 'Task 1 1',
  description: 'Task 1 1 descripton 1 1',
  parent_task_id: task.id.to_s
)
task1_1.save!

chat1_task = task.chats.new(text: 'text1', user_id: user.id.to_s, task_id: task1_1.id.to_s)
chat1_task.save!

chat1_task = task.chats.new(text: 'text2', user_id: user.id.to_s, task_id: task1_1.id.to_s)
chat1_task.save!

chat1_task = task.chats.new(text: 'text3', user_id: user.id.to_s, task_id: task1_1.id.to_s)
chat1_task.save!

task1_2 = user.tasks.new(
  name: 'Task 1 2',
  description: 'Task 1 2 descripton 1 2',
  user_id: user.id.to_s,
  parent_task_id: task1_1.id.to_s
)
task1_2.save!

task1_2_1 = user.tasks.new(
  name: 'Task 1 2 1',
  description: 'Task 1 2  1 descripton 1 2 1',
  user_id: user.id.to_s,
  parent_task_id: task1_2.id.to_s
)
task1_2_1.save!

task2 = user.tasks.new(
  name: 'Task 2',
  description: 'Task 2 descripton 2',
  user_id: user.id.to_s,
  parent_task_id: nil
)
task2.save!

user2 = User.new(email: 'slava@gmail2.com', password: '123456')
user2.save!

task1_user2 = user2.tasks.new(
  name: 'Task 1 user2',
  description: 'Task 1 descripton 1',
  user_id: user2.id.to_s,
  parent_task_id: nil
)
task1_user2.save!

task2_user2 = user2.tasks.new(
  name: 'Task 1 user2',
  description: 'Task 1 descripton 1',
  user_id: user2.id.to_s,
  parent_task_id: task1_user2.id.to_s
)
task2_user2.save!

task2_user2_chat1 = task2_user2.chats.new(text: 'text1', user_id: user2.id.to_s, task_id: task2_user2.id.to_s)
task2_user2_chat1.save!

task2_user2_chat2 = task2_user2.chats.new(text: 'text2', user_id: user2.id.to_s, task_id: task2_user2.id.to_s)
task2_user2_chat2.save!

task2_user2_chat3 = task2_user2.chats.new(text: 'text3', user_id: user2.id.to_s, task_id: task2_user2.id.to_s)
task2_user2_chat3.save!