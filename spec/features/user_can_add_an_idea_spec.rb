feature "user can add an idea", :js => true do
  scenario "they see all the " do
    create_ideas

    visit root_path
    wait_for_ajax

    click_on 'OMG I have an idea!'
    fill_in 'Title', :with => 'NEW IDEA!'
    fill_in 'Body', :with => 'I have a new idea!'
    click_on 'Save!'

    wait_for_ajax

    within("li:nth-child(4)") {
      expect(page).to have_content 'NEW IDEA!'
      expect(page).to have_content 'I have a new idea!'
      expect(page).to have_content 'swill'
    }
  end
end
