require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "POST create" do
    let(:sender_account) { FactoryBot.create(:account) }
    let(:receiver_account) { FactoryBot.create(:account) }

    it "creates a new transaction" do
      post :create, params: { from_id: sender_account.id,
                              to_id: receiver_account.id,
                              amount_cents: 100
                            }

      expect(response).to be_success
    end

    it "returns 422 if incorrect transaction" do
        post :create, params: {
                                amount_cents: 100
                              }

        expect(response.status).to eq 422
      end
  end
end
