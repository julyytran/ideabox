feature "user can edit an idea", :js => true do
  scenario "they edit the title" do
    Idea.create(title: "Kewl Idea", body: "I have kewl ideas")

    visit root_path
    wait_for_ajax

    find(".title").click
    find(".title").native.send_keys('s for days')
    find(".title").native.send_keys(:return)

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'Kewl Ideas for days'
      expect(page).to have_content 'I have kewl ideas'
      expect(page).to have_content 'swill'
    }
  end

  scenario "they edit the body" do
    Idea.create(title: "Kewl Idea", body: "I have kewl ideas")

    visit root_path
    wait_for_ajax

    find(".body").click
    find(".body").native.send_keys(' for days')
    find(".body").click
    find(".body").native.send_keys(' for days')
    find(".body").native.send_keys(:return)

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'Kewl Idea'
      expect(page).to have_content 'I have kewl ideas for days'
      expect(page).to have_content 'swill'
    }
  end
end
