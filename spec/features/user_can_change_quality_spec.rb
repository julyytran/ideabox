feature "user can change quality", :js => true do
  scenario "they upvote" do
    create_ideas

    visit root_path
    wait_for_ajax

    within("li:first-child") {
      click_on "Thumbs Up!"
    }

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content "plausible"
      expect(page).to_not have_content "swill"
      expect(page).to_not have_content "genius"
    }

    within("li:first-child") {
      click_on "Thumbs Up!"
    }

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content "genius"
      expect(page).to_not have_content "plausible"
      expect(page).to_not have_content "swill"
    }
  end

  scenario "they downvote" do
    Idea.create(title: "Genius", body: "genius idea", quality: "genius")

    visit root_path
    wait_for_ajax

    within("li:first-child") {
      click_on "Thumbs Down!"
    }

    expect(page).to have_content "plausible"
    expect(page).to_not have_content "swill"
    expect(page).to_not have_content "genius"

    within("li:first-child") {
      click_on "Thumbs Down!"
    }

    expect(page).to have_content "swill"
    expect(page).to_not have_content "genius"
    expect(page).to_not have_content "plausible"
  end

  scenario "swill cannot be downvoted more" do
    Idea.create(title: "Swill", body: "swill idea", quality: "swill")

    visit root_path
    wait_for_ajax

    expect(page).to have_content "swill"
    expect(page).to_not have_content "genius"
    expect(page).to_not have_content "plausible"

    within("li:first-child") {
      click_on "Thumbs Down!"
    }

    expect(page).to have_content "swill"
    expect(page).to_not have_content "genius"
    expect(page).to_not have_content "plausible"
  end

  scenario "genius cannot be upvoted more" do
    Idea.create(title: "Genius", body: "genius idea", quality: "genius")

    visit root_path
    wait_for_ajax

    expect(page).to have_content "genius"
    expect(page).to_not have_content "swill"
    expect(page).to_not have_content "plausible"

    within("li:first-child") {
      click_on "Thumbs Down!"
    }

    expect(page).to have_content "genius"
    expect(page).to_not have_content "swill"
    expect(page).to_not have_content "plausible"
  end
end
