gem 'devise' if yes?('Do you want to add \'devise\' gem?')

layout_choice = ask('What layout do you want to use \'Bootstrap\' or \'Foundation\'?')

case layout_choice
when /bootstrap/i
	gem 'twitter-bootstrap-rails'
when /foundation/i
	gem 'foundation-rails'
end

run 'bundle install'

generate 'devise:install'

generate 'bootstrap:install static' if !!(layout_choice =~ /bootstrap/i)

generate 'foundation:install' if !!(layout_choice =~ /foundation/i)

create_devise_model if yes?('Do you want to create devise model now?')

def create_devise_model	
	devise_model = ask('What is the name of your devise model?')
	puts 'generating devise model...'
	generate(:devise, devise_model)
	puts 'running db:migrate...'
	rake 'db:migrate'
end