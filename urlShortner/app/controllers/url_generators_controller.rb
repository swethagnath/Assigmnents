class UrlGeneratorsController < ApplicationController
	def create
		@url = UrlGenerator.new(url_params)	
		@url.check_the_url
		if @url.modified_url.nil?	
			redirect_to url_generators_path,notice:"shortened version of this  is  url already exist:#{@url.encoded_url}"
		else	
			binding.pry					
			@url.save!
			respond_to do |format| 
				format.js
			end
		end
	end
	def show	
		@url = UrlGenerator.find_by(encoded_url:params[:encoded_url])
		redirect_to @url.modified_url
	end
	def import
		UrlGenerator.import(params[:file])
		redirect_to url_generators_path, notice: "urls imported."
	end
	private
		def url_params
			params[:url_generator].permit(:url)
		end
end
