
describe TemplatesController do

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sign_in" do
    it "returns http success" do
      get :sign_in
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #sign_up" do
    it "returns http success" do
      get :sign_up
      expect(response).to have_http_status(:success)
    end
  end

end
