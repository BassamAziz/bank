# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    status { :active }
    balance_cents { 10000000 }
    balance_currency { :usd }
    sequence(:account_number) { |n| "#{n}#{Faker::Config.random.seed}" }
    association :client
  end
end

# == Schema Information
#
# Table name: accounts
#
#  id               :bigint           not null, primary key
#  status           :string
#  balance_cents    :integer          default(0), not null
#  balance_currency :string           default("USD"), not null
#  account_number   :string
#  client_id        :bigint
#
