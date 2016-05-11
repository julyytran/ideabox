RSpec.describe "POST ideas index" do
  it "creates an idea" do
    idea_params = {title: "New Idea", body: "the newest idea"}

    post "/api/v1/ideas", idea: idea_params

    expect(response.status).to eq 200
    expect(Idea.last.title).to eq "New Idea"
  end
end
