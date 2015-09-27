
describe ProjectsController do

  before :each do
    sign_in_user
    @valid_params = { project: attributes_for(:project).merge(user_id: subject.current_user.id) }
    @invalid_params = { project: attributes_for(:project, name: '').merge(user_id: subject.current_user.id) }
  end

  def create_project
    create(:project, user: subject.current_user)
  end


  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end


  describe "GET #index" do
    it "returns success json" do
      3.times{ create_project }
      get :index
      expect(response.body).to have_json_size(3)
    end
  end


  describe "POST #create" do
    it "returns http created" do
      post :create, @valid_params
      expect(response).to have_http_status(:created)
    end

    it "returns http unprocessable_entity" do
      post :create, @invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end


  describe "PUT #update" do
    it "returns http ok" do
      put :update, @valid_params.merge(id: create_project.id)
      expect(response).to have_http_status(:ok)
    end

    it "returns http unprocessable_entity" do
      put :update, @invalid_params.merge(id: create_project.id)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    it "returns http no_content" do
      delete :destroy, id: create_project.id
      expect(response).to have_http_status(:no_content)
    end
  end
end
