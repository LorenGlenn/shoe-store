require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add brand', {:type => :feature}) do
  it('lets user add a new brand') do
    visit('/')
    fill_in('brand-name', :with =>'Nike')
    fill_in('description', :with => 'cool')
    click_button('Add Brand')
    expect(page).to have_content('Success!')
  end
end
