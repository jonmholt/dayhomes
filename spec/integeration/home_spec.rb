require 'spec_helper'

describe 'home page' do
  it 'welcomes the user' do
    include Capybara::DSL
    visit '/'
    page.should have_content('Welcome')
  end
end