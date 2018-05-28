require "rails_helper"
RSpec.describe Api::V1::UrlGeneratorsController,type: :controller  do
  describe "GET #index" do
    it "returns list of short urls" do
      @url = create(:url_generator)
      get :index
     	expect(JSON.parse(response.body)["list_of_short_urls"][0]).to_not eq(nil)
    end
  end
  describe "GET #show" do   
    it "returns the orginal url" do
      @url = create(:url_generator)
      get :show, params:{id:@url.encoded_url}
     	expect(JSON.parse(response.body)["orginal_url"]).to eq(@url.url)
    end
  end
  describe "post #create" do  
    it "should return cannot create since a short link" do 
      @url = create(:url_generator)
      post :create,params:{:url_generator=>{url:@url.url}}
      expect(JSON.parse(response.body)["notice"]).to eq("cannot create since a short link for this url is already exit")
    end
    it "should return successfully created" do 
      @url = build(:url_generator,url:"www.stackoverflow.com")
      post :create,params:{:url_generator=>{url:@url.url}}
      expect(JSON.parse(response.body)["notice"]).to eq("successfully created")
    end
  end
  describe "delete #destroy" do  
    it "should return successfully destroyed" do 
      @url = create(:url_generator)
      delete :destroy,params:{id:@url.encoded_url}
      expect(JSON.parse(response.body)["notice"]).to include("successfully destroyed")
    end
  end
  describe "get #modified_url" do  
    it "should " do 
      @url = create(:url_generator)
      get :modified_url,params:{url:@url.encoded_url}
      expect(JSON.parse(response.body)["modified_url"]).to include(@url.modified_url)
    end
  end
end