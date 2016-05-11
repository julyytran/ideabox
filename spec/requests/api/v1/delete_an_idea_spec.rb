RSpec.describe "DELETE ideas index" do
  it "deletes the idea" do
    create_ideas
    idea = Idea.last
    count = Idea.count

    delete "/api/v1/ideas/#{idea.id}"

    expect(response.status).to eq 200
    expect(Idea.count).to eq (count - 1)
  end
end
