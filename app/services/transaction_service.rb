# frozen_string_literal: true

class TransactionService
  def initialize; end

  def self.transfer(transactoin_params)
    Transaction.create(transactoin_params)
  end

  def self.account_transactions(account:)
    Transaction.where(to: account).or(
      Transaction.where(from: account)
    )
  end
end
