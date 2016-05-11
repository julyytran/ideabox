RSpec.describe "GET ideas index" do
  it "returns a list of all ideas" do
    create_ideas

    get "/api/v1/ideas"

    expect(response.status).to eq 200
    json_body = JSON.parse(response.body)
    expect(json_body.count).to eq(3)

    idea = json_body[0]

    expect(idea).to eq ({
      "id" => idea["id"],
      "title" => "Kewl Idea",
      "body" => "I have kewl ideas",
      "quality" => "swill",
      "created_at"=> idea["created_at"],
      "updated_at"=> idea["updated_at"]
      })
  end
end
