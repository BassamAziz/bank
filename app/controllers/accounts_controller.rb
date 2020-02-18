# frozen_string_literal: true

class AccountsController < ApplicationController
  LATEST_TRANSACTIONS_COUNT = 10

  def show
    render json: account
  end

  def account_summary
    latest_transactions = TransactionService.account_transactions(account: account).limit(LATEST_TRANSACTIONS_COUNT)

    render json: { balance: account.balance_cents,
                   latest_transactions: latest_transactions }
  end

  private

  def account
    account = Account.find(account_params[:id])
  end

  def account_params
    params.permit(:id)
  end
end
