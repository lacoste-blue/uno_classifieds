RSpec.shared_examples 'a success response' do |resource|
  it { expect(response).to be_success }
  it { expect(response).to render_template resource }
end

RSpec.shared_examples 'a protected resource' do
  it 'should be redirected to signin', :logged_out do
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end
end

RSpec.shared_examples 'indexes resource' do |resource, resource_class|
  it "should return all #{resource}" do
    expect(assigns(resource)).to match(resource_class.all)
  end
end

RSpec.shared_examples 'destroy resource' do |resource_class, redirect, status|
  it 'destroys the requested resource' do
    resource = resource_from_controller(subject)
    expect do
      delete :destroy, :params => { :id => resource.to_param }, :session => {}
    end.to change(resource_class, :count).by(-1)
  end

  it "redirects to #{resource_class}" do
    resource = resource_from_controller(subject)
    redirect ||= resource_class
    status ||= 302
    request.env['HTTP_REFERER'] = resource_class
    delete :destroy, :params => { :id => resource.to_param }, :session => {}
    expect(response).to redirect_to(redirect)
    expect(response.status).to be(status)
  end
end

RSpec.shared_examples 'updatable resource' do |resource_type, new_attr|
  before do
    @resource = resource_from_controller(subject)
    @new_params = { :id => @resource.id, resource_type => new_attr }
  end

  it 'updates the resource' do
    put :update, :params => @new_params
    @resource.reload
    @new_params[resource_type].each do |k, v|
      expect(@resource[k]).to eq(v)
    end
  end

  it 'redirects to the resource' do
    put :update, :params => @new_params
    expect(response).to redirect_to(@resource)
  end
end

def resource_from_controller(subject)
  class_string = subject.controller_path.classify
  FactoryBot.create(class_string.underscore)
end

