class DemoController < ApplicationController
  	layout 'application'

	def index
		#render(:template => 'demo/hello')
	end

	def hello
		#render(:template => 'demo/index')
		@array = [1, 2, 3, 4, 5]
	end

	# Testing newer hash style notation.
	def other_hello
		redirect_to(controller:'demo', action:'index')
	end

	def google
		redirect_to('http://www.google.com.au')
	end

	def logging
		logger.debug("This is debug...")
		logger.info("This is info...")
		logger.warn("This is warning...")
		logger.error("This is error...")
		logger.fatal("This is fatal...")
		render(text: "Logged")
	end
end
