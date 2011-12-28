#$new
rails new demo

#$server
demo> rails server

#$webrick
demo> rails server webrick  

#$controller,controller=say,action=[hello,goodbye]
demo> rails generate controller Say hello goodbye

#$scaffold
demo> rails generate scaffold Product title:string description:text image_url:string price:decimal

#$db $migrate $rake
demo > rake db:migrate

#$problem
base_path,Èç¹ûÓÃ£¿

#$new  -T  without test directory $rails
rails new sample_app -T

#$bundle $install,run everytime after edit gemfile 
bundle install

#$rspec $install 
rails generate rspec:install
#run rspec
bundle exec rake spec
#run a file
bundle exec rspec spec/models/user_spec.rb

#$git
git init
git add .
git commit -m "Initial commit"

git remote
git remote -v

it¡¯s important to note that the command pulls the data to your local repository-
it doesn¡¯t automatically merge it with any of your work or modify what you¡¯re currently working on. 
You have to merge it manually into your work when you¡¯re ready.
rails generate migration add_quantity_to_line_items quantity:integer

#$git init,push to demo.git
mkdir demo
cd demo
git init
touch README
git add README
git commit -m 'first commit'
git remote add origin git@github.com:bjmark/demo.git
git push -u origin master


$ rails console
>> ActiveSupport::Inflector.pluralize "project"
=> "projects"
>> ActiveSupport::Inflector.pluralize "virus"
=> "viri"
>> "pensum".pluralize # Inflector features are mixed into String by
default
=> "pensums"



