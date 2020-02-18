# frozen_string_literal: true

class TransactionsController < ApplicationController
  def create
    @transaction = TransactionService.transfer(transaction_params)

    if @transaction.valid?
      render json: @transaction, status: :created
    else
      render json: @transaction.errors.messages, status: :unprocessable_entity
    end
  end

  def index
    transactions = TransactionService.account_transactions(account: account)
    render json: transactions
  end

  private

  def transaction_params
    params.permit(:amount_cents, :from_id, :to_id)
  end

  def account_id
    params.permit(:account_id)[:account_id]
  end

  def account
    Account.find(account_id)
  end
end
