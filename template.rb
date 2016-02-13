puts 'add gems...'
gem 'devise'
gem "twitter-bootstrap-rails"

# puts 'run bundle install...'
run 'bundle install'

# puts 'installing bootstrap...'
generate 'bootstrap:install static' if yes?('Do you want to install \'twitter-bootstrap-rails\' gem?')
# puts 'installing devise...'
install_devise = yes?('Do you want to install \'devise\' gem?')
generate 'devise:install' if install_devise

# route "root to: 'devise:sessions#new'"

create_devise_model if install_devise and yes?('Do you want to create devise model now?')

puts 'finished...'

def create_devise_model	
	devise_model = ask('What is the name of your devise model?')
	puts 'generating devise model...'
	generate(:devise, devise_model)
	puts 'running db:migrate...'
	rake 'db:migrate'
end
