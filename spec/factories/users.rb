# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname "MyString"
    lastname "MyString"
    image "MyText"
    username "MyString"
    role "MyString"
  end
end
