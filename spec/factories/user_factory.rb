FactoryBot.define do

  factory :user, class: User do |u|
    u.sequence(:email) {|n| "factory-user-#{n}@email.domain"}
    u.password { 'p@ssw0rd' }
  end
end
