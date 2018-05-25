class Api::V1::UrlGeneratorsController < Api::V1::ApiController
	#method : get
	#localhost:3000/api/v1/url_generators 
	def index
		@urls = UrlGenerator.select("encoded_url").all
		array = []
		@urls.each do |url|
			array.push(url.encoded_url)
		end
		render json:{list_of_short_urls:array}
	end
	#method :post
	#localhost:3000/api/v1/url_generators
	#using postman tool:the url as well as the user_id is input
	def create
		@url = UrlGenerator.new(url_params)
		@url.check_the_url
		if @url.modified_url.nil?
			render json:{notice: "cannot create since a short link for this url is already exit",encoded_url:@url.encoded_url}
		else
			@url.save
			render json:{notice: "successfully created",url:@url}					
		end
	end
	# method : get
	#localhost:3000/api/v1/url_generators/fW0aXOGk
	def show
		@url = UrlGenerator.find_by(encoded_url:params[:id])
		if @url.nil?
			render json:{error:"not found"}
		else
			render json:{orginal_url:@url.url}
		end
	end
	# method : delete
	#localhost:3000/api/v1/url_generators/MpllhJwH,rRA6PWjW
	def destroy
		array_of_short_urls = params[:id].split(",")
		@urls = UrlGenerator.where(encoded_url:array_of_short_urls)
		if @urls.empty?
			render json:{error:"not found"}
		else
			@urls.destroy_all
			render json:{notice:"successfully destroyed"}
		end
	end
	#localhost:3000/api/v1/url_generators/modified_url?url=fW0aXOGk
	def modified_url
		@url = UrlGenerator.find_by(encoded_url:params["url"])
		if @url.nil?
			render json:{error:"not found"}
		else
			render json:{modified_url:@url.modified_url}
		end
	end
	private
		def url_params
			params[:url_generator].permit(:url,:user_id)
		end
end