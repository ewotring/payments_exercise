require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe "Checks the total payments" do
    it 'returns the total payments' do
      loan = Loan.create!(funded_amount: 100.0)
      payment1 = loan.payments.create!(payment_amount: 50.0, loan_id: loan.id)
      payment2 = loan.payments.create!(payment_amount: 20.0, loan_id: loan.id)
      expect(loan.total_payment).to eq(70.0)
    end
  end
end
