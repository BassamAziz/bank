# frozen_string_literal: true

class Account < ApplicationRecord
  include AASM

  aasm column: :status do
    state :active, initial: true
    state :on_hold
    state :closed
  end

  belongs_to :client

  validates :account_number, uniqueness: true, presence: true

  def deposit(amount:)
    update(balance_cents: balance_cents + amount)
  end

  def withdraw(amount:)
    return false if amount > balance_cents
    update(balance_cents: balance_cents - amount)
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
