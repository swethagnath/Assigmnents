require "rails_helper"
RSpec.describe 'UrlGenerator',type: :model  do
	describe 'UrlGenerator' do
		it 'should be valid' do
     		@url = create(:url_generator)
     		expect(@url).to be_valid
		end
	end
end 	
