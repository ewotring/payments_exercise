# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

ERIK COMMENTS
create payment for a given loan
DONE a loan can have many payments, but a payment belongs to one loan
DONE need to create migration and model for payment
DONE? payment needs date of payment and amount of payment
  timestamps (could play with datetime.now) for date of payment (what time zone? maybe stick to UTC)
DONE outstanding balance should be `funded_amount` - the sum of all of the payment amounts belonging to that loan
validation
  if payment amount exceeds outstanding balance, prohibit payment creation and return validation errors
DONE need payment controller (rails generate?; did not use)
  need payment#show
  need payment#index
Do I need additional columns for the loan table?
  outstanding_balance could go into the loan table as a column