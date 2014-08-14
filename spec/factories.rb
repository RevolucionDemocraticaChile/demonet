FactoryGirl.define do
	factory :user do |u|
		u.sequence(:username) { |n| "username#{n}" }
		u.sequence(:email) { |n| "email#{n}@email.com" }
		u.sequence(:name) { |n| "Name#{n} Surname#{n}" }
		u.password "secret"
		u.password_confirmation "secret"
	end
end
