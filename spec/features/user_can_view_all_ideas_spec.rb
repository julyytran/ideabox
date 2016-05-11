feature "user can view all ideas" do
  scenario "they see all the ideas" do
    create_ideas

    visit root_path

# add css selectors
# assert div count == 3
#assert body and quality
    expect(page).to have_content "Kewl Idea"
    expect(page).to have_content "Awesome Idea"
    expect(page).to have_content "Legit Idea"
  end
end
