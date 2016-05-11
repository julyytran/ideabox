feature "user can delete an idea", :js => true do
  scenario "they don't see the deleted idea " do
    create_ideas

    visit root_path
    wait_for_ajax

    within("li:first-child") {
      click_on "Delete!"
    }

    wait_for_ajax

    expect(page).to_not have_content "Kewl Idea"
    expect(page).to_not have_content "I have kewl ideas"
  end
end
