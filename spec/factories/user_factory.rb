FactoryBot.define do

  factory :user, class: User do |u|
    # use sequence(:email) for dynamic generating email
    # u.sequence(:email) {|n| "factory-user-#{n}@email.domain"} 
    u.email { 'user@email.domain' }
    u.password { 'p@ssw0rd' }
  end
end
