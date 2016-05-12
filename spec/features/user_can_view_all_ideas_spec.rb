feature "user can view all ideas", :js => true do
  scenario "they see all the ideas" do
    create_ideas

    visit root_path
    wait_for_ajax

    expect(Idea.count).to eq 3
    expect(page).to have_selector("li", count: 3)

    within("li:first-child") {
      expect(page).to have_content "Legit Idea"
      expect(page).to have_content "I have legit ideas"
      expect(page).to have_content "swill"
    }

    within("li:nth-child(2)") {
      expect(page).to have_content "Awesome Idea"
      expect(page).to have_content "I have awesome ideas"
      expect(page).to have_content "swill"
    }

    within("li:nth-child(3)") {
      expect(page).to have_content "Kewl Idea"
      expect(page).to have_content "I have kewl ideas"
      expect(page).to have_content "swill"
    }
  end
end
