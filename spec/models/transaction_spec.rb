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

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.build(:transaction) }

  it 'creates a valid object' do
    expect(transaction).to be_valid
  end
end
