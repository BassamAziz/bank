# frozen_string_literal: true

class Transaction < ApplicationRecord
  include AASM

  aasm column: :status do
    state :initiated, initial: true
    state :pending
    state :in_process
    state :rejected
    state :cancelled
    state :complete
  end

  belongs_to :to, class_name: 'Account'
  belongs_to :from, class_name: 'Account'

  validates :transaction_number, uniqueness: true

  before_validation :generate_transaction_number
  before_create :update_accounts

  private

  def update_accounts
    raise ActiveRecord::Rollback, "Account doesn't have enough balance" unless from.withdraw(amount: amount_cents)
    to.deposit(amount: amount_cents)
  end

  def generate_transaction_number
    self.transaction_number ||= SecureRandom.hex
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
