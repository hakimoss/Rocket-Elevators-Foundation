require 'sendgrid-ruby'
include SendGrid


from = SendGrid::Email.new(email: 'rocketelevator@hotmail.com')
to = SendGrid::Email.new(email: 'hakimososos@gmail.com')
subject = 'Sending with Twilio SendGrid is Fun'
content = SendGrid::Content.new(type: 'text/plain', value: 'ca fonctionne')
mail = SendGrid::Mail.new(from, subject, to, content)


test = ENV["SENDGRID_API_KEY"]
puts "+++++++++++"
puts test
puts "+++++++++++"

#puts "this is my key: #{ENV["SENDGRID_API_KEY"]}"
sg = SendGrid::API.new(api_key: "#{ENV["SENDGRID_API_KEY"]}")
puts "========="
puts sg 
puts "========="
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers