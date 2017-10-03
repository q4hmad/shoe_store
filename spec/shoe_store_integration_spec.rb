require('spec_helper')

#The user should be able to .

describe('viewing ', {:type => :feature}) do
  it('allows a user to input a') do
    visit('/')

    fill_in('a', :with => "")
    click_button('Submit')
    expect(page).to have_content("")
  end
end
