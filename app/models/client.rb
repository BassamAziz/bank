# frozen_string_literal: true

class Client < ApplicationRecord
  include AASM

  aasm column: :status do
    state :active, initial: true
    state :on_hold
    state :closed
  end

  has_many :accounts
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
