require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('Test adding places', {:type => :feature}) do
  it('Displays a user''s place after adding it') do
    visit('/')
    fill_in('description', :with => "London")
    click_button('Add place')
    click_link("Back to main screen.")
    expect(page).to have_content("London")
  end
end

describe('Test clearing places', {:type => :feature}) do
  it('clears a user''s places after it''s added') do
    visit('/')
    fill_in('description', :with => "Dublin")
    click_button('Add place')
    click_link("Back to main screen.")
    expect(page).to have_content("Dublin")
    click_button('Clear places')
    click_link("Back to main screen.")
    expect(page).to_not have_content("Dublin")
  end
end
