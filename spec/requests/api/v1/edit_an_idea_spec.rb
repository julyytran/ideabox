RSpec.describe "PATCH ideas index" do
  it "edits an idea" do
    create_ideas
    idea = Idea.first
    idea_params = {title: "New Idea", body: "the newest idea"}

    patch "/api/v1/ideas/#{idea.id}", idea: idea_params

    expect(response.status).to eq 200
    expect(Idea.first.title).to eq "New Idea"
  end
end
