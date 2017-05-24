require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add store', {:type => :feature}) do
  it('lets user add a new store') do
    visit('/')
    fill_in('name', :with =>'Footlocker')
    click_button('Add Store')
    expect(page).to have_content('Success!')
  end
end
