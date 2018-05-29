# Assigmnents
#Pre-requisites

Ruby version : ruby 2.4.2p198

rails : Rails 5.1.6

database : sqlite3

unit testing : Rspec along with "factory_bot_rails" description with gem 'rspec-rails' and gem "factory_bot_rails" in the gem file in the root within the spec folders:

url shortner application clone https://github.com/swethagnath/Assigmnents.git repo and run the following commands in terminal to start the application rails s

*Controller *Have developed a simple form for shortnening urls in the table using rails *Show a list of all shortend urls in the table using rails *Users when click the shortend URL ,the will be taken to the new tab where they are redirected to the original URL *Added ability to create bulk shortend URLs using .csv file upload *Extra:Used Ajax to call the API to show the list of shortend URLs

*API:api/v1/url_generators_controller.rb This API can be called through POSTMAN tool or by using Ajax The routes is named by their Folder names and file where the reside within were resources are provided where all the actions resides

#method :post
#url:localhost:3000/api/v1/url_generators
	*creating a shortened url

#method : get
#localhost:3000/api/v1/url_generators 
	*fetching list of shortened urls

# method : get
#localhost:3000/api/v1/url_generators/fW0aXOGk
	*fetching original url from a shortened url

# method : delete
#localhost:3000/api/v1/url_generators/MpllhJwH,rRA6PWjW
	*deleting shortened-urls
*Unit Test run the following commands to execute the tests for the api controller and for model methods: 
*bundle exec rspec spec/request/url_generators_controller_spec.rb 
*bundle exec rspec spec/request/url_generator_model_spec.rb
