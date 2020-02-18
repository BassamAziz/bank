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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
