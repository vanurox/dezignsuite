class NotifyMailer < ActionMailer::Base
	default :to => "dezignsuitemohali@gmail.com"
	
	def notify(data)
		@data = data
		mail(from: data.name, subject: "Contact- Message from #{data.email}")
	end

	def workshop_notify(data)
		@data = data
		mail(from: data.name, subject: "Workshop- Message from #{data.email}")
	end

	def career_notify(data)
		@data = data
		mail(from: data.name, subject: "Career- Message from #{data.email}")
	end

	def program_notify(data)
		@data = data
		mail(from: data.name, subject: "Program- Message from #{data.email}")
	end
end