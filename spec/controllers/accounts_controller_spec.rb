require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "GET account_summary" do
    let(:account) { FactoryBot.create(:account) }
    let!(:transactions) { FactoryBot.create_list(:transaction, 5, to: account, amount_cents: 10)}

    it "returns account balance and latest transactions" do
      get :account_summary, params: { id: account.id }
      body = JSON.parse response.body #

      expect(response).to be_success
      expect(body['latest_transactions'].count).to eq 5
      expect(body['balance']).to eq 10000050
    end
  end
end
