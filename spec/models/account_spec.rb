# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { FactoryBot.build(:account) }

  it 'creates a valid object' do
    expect(account).to be_valid
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
