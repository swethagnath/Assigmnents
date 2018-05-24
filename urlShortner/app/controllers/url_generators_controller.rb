class UrlGeneratorsController < ApplicationController
	def index
	end
	def create
		@url = UrlGenerator.new(url_params)
		@url.user_id = current_user.id
		@url.check_the_url
		if @url.modified_url.nil?	
			redirect_to url_generators_path,notice:"shortened url is already exit for this url:#{@url.encoded_url}"
		else						
			@url.save
			respond_to do |format| 
				format.js
			end
			# redirect_to url_generators_path,notice:"successfully created"
		end
	end
	def show	
		@url = UrlGenerator.find(params[:id])
		redirect_to @url.modified_url
	end
	def import
	  UrlGenerator.import(params[:file],current_user)
	  redirect_to url_generators_path, notice: "urls imported."
	end
	private
		def url_params
			params[:url_generator].permit(:url)
		end
end
