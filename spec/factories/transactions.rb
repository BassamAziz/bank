
FactoryBot.define do
  factory :transaction do
    association :from, factory: :account
    association :to, factory: :account
    status { :complete }
    amount_cents { 100 }
    amount_currency { :eur }
    sequence(:transaction_number) { |n| "#{n}#{Faker::Config.random.seed}" }
  end
end

# == Schema Information
#
# Table name: transactions
#
#  id                 :bigint           not null, primary key
#  from_id            :bigint
#  to_id              :bigint
#  status             :string
#  amount_cents       :integer          default(0), not null
#  amount_currency    :string           default("USD"), not null
#  transaction_number :string
#