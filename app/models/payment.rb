class Payment < ActiveRecord::Base
	belongs_to :loan
	validate :payment_cannot_exceed_outstanding_balance

	def payment_cannot_exceed_outstanding_balance
		if loan.outstanding_balance < self.payment_amount
			errors.add(:payment, "cannot exceed outstanding balance.")
			return self.errors.full_messages
		end
	end

end
