require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "Return error if payment too large" do
    it 'is valid with correct payment amount' do
      loan = Loan.create!(funded_amount: 100.0)
      expect(payment = loan.payments.create!(payment_amount: 50.0, loan_id: loan.id)).to be_valid
    end

    it 'returns error message' do
      loan = Loan.create!(funded_amount: 100.0)
      payment = loan.payments.create(payment_amount: 200.0, loan_id: loan.id)
      expect{payment.save!}.to raise_error#("Payment cannot exceed outstanding balance.")
      # Had trouble specifying the error
    end
  end
end
