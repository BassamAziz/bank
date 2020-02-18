
FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    status { :active }
  end
end

# == Schema Information
#
# Table name: clients
#
#  id            :bigint           not null, primary key
#  name          :string
#  status        :string
#  client_number :string
#
