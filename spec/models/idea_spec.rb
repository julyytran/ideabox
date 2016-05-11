require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :quality }

  it "has default quality of swill" do
    idea = Idea.create(title: "Good idea", body: "get double scoops of ice cream")

    expect(idea.quality).to eq("swill")
  end
end
