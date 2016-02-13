gem 'devise' if yes?('Do you want to add \'devise\' gem?')

layout_choice = ask('What layout do you want to use \'Bootstrap\' or \'Foundation\'?')

case layout_choice
when /bootstrap/i
	gem 'twitter-bootstrap-rails'
	run 'bundle install'
	generate 'bootstrap:install static'
when /foundation/i
	gem 'foundation-rails'
	run 'bundle install'
	generate 'foundation:install'
end

generate 'devise:install'

create_devise_model if yes?('Do you want to create devise model now?')

def create_devise_model	
	devise_model = ask('What is the name of your devise model?')
	puts 'generating devise model...'
	generate(:devise, devise_model)
	puts 'running db:migrate...'
	rake 'db:migrate'
end