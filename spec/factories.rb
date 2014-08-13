FactoryGirl.define do
	factory :user do
		username              "username"
		email                 "email@email.com"
		name                  "Name Surname"
		password              "thepass"
		password_confirmation "thepass"
	end
end
