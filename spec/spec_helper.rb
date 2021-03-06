module Factory
  def create_ideas
    Idea.create(title: "Kewl Idea", body: "I have kewl ideas")
    Idea.create(title: "Awesome Idea", body: "I have awesome ideas")
    Idea.create(title: "Legit Idea", body: "I have legit ideas")
  end
end

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
