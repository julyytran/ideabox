feature "user can search ideas", :js => true do
  scenario "they see ideas containing search query" do
    create_ideas

    visit root_path
    wait_for_ajax

    expect(page).to have_selector("li", count: 3)

    fill_in 'search-box', :with => 'legit'

    wait_for_ajax

    expect(page).to have_selector("li", count: 1)
    expect(page).to have_content "Legit Idea"
    expect(page).to_not have_content "Kewl Idea"
    expect(page).to_not have_content "Awesome Idea"
  end
end
