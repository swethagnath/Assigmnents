require 'csv'
class UrlGenerator < ApplicationRecord
	before_validation :check_the_url,on: :create
	validates_presence_of :url,:modified_url,:encoded_url
	validates_uniqueness_of :encoded_url
	def eight_chara
		char_number = ('0'..'9').to_a
		char_caps_alphabets = ('A'..'Z').to_a
		char_small_alphabets = ('a'..'z').to_a
		password_array = char_number + char_caps_alphabets + char_small_alphabets
		array = []
		i = 0
		while i < 8
			array.push(password_array.sample(1))
			i += 1
		end
		array.join("")
	end
	def calculating_encoded_url	
		short_url = eight_chara
		while true 
			value = UrlGenerator.find_by(encoded_url:short_url) #to make unique urls
			if value === nil 
				self.encoded_url = short_url
				break
			else
				short_url = eight_chara
			end			
		end
	end
	def check_the_url
		removed_extra_format_from_url = self.url.sub(/^https?\:\/\//, '').sub(/^www./,'').sub(/http\:\/\/www./, '').sub(/https\:\/\/www./, '').sub(/^http?\:\/\//, '')
		value = UrlGenerator.find_by(modified_url:"http://#{removed_extra_format_from_url}")
		if value.nil?
			self.modified_url = "http://#{removed_extra_format_from_url}"
			calculating_encoded_url
		else
			self.encoded_url = value.encoded_url
		end
	end
	def self.import(file)
		CSV.foreach(file.path,headers: true) do |row|
			url      = UrlGenerator.new row.to_hash
			url.check_the_url
			url.save
		end
	end
end