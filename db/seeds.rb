# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'slava@gmail.com', password: '123456')
user.save!

task = user.tasks.new(name: 'Task 1', description: 'Task 1 descripton 1')
task.save!

chat1_task = task.chats.new(text: 'text1')
chat1_task.save!

task1_1 = user.tasks.new(
  name: 'Task 1 1',
  description: 'Task 1 1 descripton 1 1',
  parent_task_id: task.id.to_s
)
task1_1.save!

task1_2 = user.tasks.new(
  name: 'Task 1 2',
  description: 'Task 1 2 descripton 1 2',
  parent_task_id: task1_1.id.to_s
)
task1_2.save!

task1_2_1 = user.tasks.new(
  name: 'Task 1 2 1',
  description: 'Task 1 2  1 descripton 1 2 1',
  parent_task_id: task1_2.id.to_s
)
task1_2_1.save!

task2 = user.tasks.new(name: 'Task 2', description: 'Task 2 descripton 2')
task2.save!