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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
