require 'spec_helper'

describe U::RequestController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'confirm'" do
    it "returns http success" do
      get 'confirm'
      expect(response).to be_success
    end
  end

  describe "GET 'complete'" do
    it "returns http success" do
      get 'complete'
      expect(response).to be_success
    end
  end

  describe "GET 'thanks'" do
    it "returns http success" do
      get 'thanks'
      expect(response).to be_success
    end
  end

end
