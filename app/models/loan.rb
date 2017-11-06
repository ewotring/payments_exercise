class Loan < ActiveRecord::Base
	has_many :payments

	def total_payment
		total = 0.0
		self.payments.find_each do |payment|
			total += payment.payment_amount
		end
		# total
		# convert to float to make the output more readable. The operation in the find_each block coerces total into BigDecimal, the type that payment_amount is.
		total.to_f
	end

	def outstanding_balance
		remainder = self.funded_amount
		self.payments.find_each do |payment|
			remainder -= payment.payment_amount
		end
		# remainder
		# convert to float to make the output more readable. The operation in the find_each block coerces remainder into BigDecimal, the type that payment_amount is.
		remainder.to_f
	end
end
