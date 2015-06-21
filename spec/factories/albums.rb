FactoryGirl.define do
  factory :album do
    title "MyString"
    artist "MyString"
    released_on { Date.today }
  end
end
