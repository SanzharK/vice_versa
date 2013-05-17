package org.fyp

import com.stripe.model.Charge
import com.stripe.exception.CardException;
import com.stripe.Stripe

class CheckoutController {

	def index() { }

	def charge() {
		Stripe.apiKey = "sk_test_jcfKIoYybil8KZ9o8HGf4A0q"

		def token = params.stripeToken
		double amountDouble = params.amount.toDouble()
		Integer amountInt = amountDouble.intValue()
		def amountInCents = (amountInt * 100) as Integer
		def chargeParams = [
					'amount': amountInCents,
					'currency': 'usd',
					'card': token,
					'description': 'Payment for tender: ' + params.description
				]
		def status
		try {
			Charge.create(chargeParams)
			status = 'Your purchase was successful.'
		} catch(CardException) {
			status = 'There was an error processing your credit card.'
		}
		redirect(action: "confirmation", params: [msg: status])
		return
	}

	def confirmation(String msg) {
		[msg: msg]
	}
}
