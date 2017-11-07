class Payment < ActiveRecord::Base
	belongs_to :loan
	validate :payment_cannot_exceed_outstanding_balance

	def payment_cannot_exceed_outstanding_balance
		if loan.outstanding_balance
	end

end
