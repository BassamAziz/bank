# == Schema Information
#
# Table name: clients
#
#  id            :bigint           not null, primary key
#  name          :string
#  status        :string
#  client_number :string
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { FactoryBot.build(:client) }

  it 'creates a valid object' do
    expect(client).to be_valid
  end
end
