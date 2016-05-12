feature "user can add an idea", :js => true do
  scenario "they see their new idea add to the list " do
    create_ideas

    visit root_path
    wait_for_ajax

    fill_in 'Title', :with => 'NEW IDEA!'
    fill_in 'body', :with => 'I have a new idea!'
    click_on 'Save!'

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'NEW IDEA!'
      expect(page).to have_content 'I have a new idea!'
      expect(page).to have_content 'swill'
    }
  end
end
