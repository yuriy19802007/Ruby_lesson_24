#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
    
	erb :about
end

get '/contacts' do 

	erb :contacts

end

post '/contacts' do

	
	@user_email = params[:user_email]
	#@subject = params[:subject]
	@user_message = params[:text_user]

	

	f = File.open './public/contacts.txt', 'a'
	f.write "\nNew message:\nemail : #{@user_email}\nMessage:\n#{@user_message}"
	f.close

end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@date_time = params[:date_time]
	@choice_barber = params[:choice_barber]
	@color = params[:color]

	hh = {:user_name => 'Ener your name', 
		:user_phone => 'enter your phone', 
		:date_time => 'Enter date and time'
	}

	# for every pair key value
	
	hh.each do |key, value|
		# if params is empty then error 
		if params[key] == ''
			@error = hh[key]
		
		    return erb :visit
		end
	end

	f = File.open './public/users.txt', 'a'
	f.write "name : #{@user_name}; phone : #{@user_phone}; date : #{@date_time} \nChoose barber is #{@choice_barber},\nColor : #{@color}"
	f.close

	erb "name : #{@user_name}; phone : #{@user_phone}; date : #{@date_time} \nChoose barber is #{@choice_barber},\nColor : #{@color}"
	

end


