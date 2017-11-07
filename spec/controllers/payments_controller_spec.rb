require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    it 'routes correctly for index' do
      {:get => "/loans/#{loan.id}/payments" }.to route_to("format"=>:json, "controller"=>"payments", "action"=>"index", "loan_id"=>"1")
      # expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:payment) {Payment.create!(payment_amount: 50, loan_id: loan.id)}

    it 'responds with a 200' do
      get :show, id: payment.id
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, id: 10000
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
