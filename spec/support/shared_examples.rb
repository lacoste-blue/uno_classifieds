RSpec.shared_examples 'a success response' do |resource, params|
  it { expect(response).to be_success }
  it { expect(response).to render_template resource }
end

RSpec.shared_examples 'indexes resource' do |resource, resource_class|
  it { expect(assigns(resource)).to match(resource_class.all) }
end

# it 'returns a success response' do
#   expect(subject).to respond_with(:ok)
# end
# it { expect(response).to be_success}
# # it { expect(subject).to render_template(action) }

