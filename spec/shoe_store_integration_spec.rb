require('spec_helper')

describe('viewing the homepage', {:type => :feature}) do
  it ('allows a user to add a recipe') do
    visit('/')

    fill_in('name', :with => 'Best Biryani')
    click_button('Submit')
    expect(page).to have_content('Best Biryani')
  end
end

describe('viewing recipe info', {:type => :feature}) do
  it ('allows a user to click a recipe and see its details') do
    visit('/')

    fill_in('name', :with => 'Best Biryani')
    click_button('Submit')

    click_link('Best Biryani')
    expect(page).to have_content('Your Recipe:')
  end
end
