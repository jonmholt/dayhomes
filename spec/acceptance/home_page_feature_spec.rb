require 'acceptance/acceptance_helper'

feature 'Home Page' do
  scenario 'home page' do
    visit '/'
    page.should have_content('Featured Day Homes')
  end
end
