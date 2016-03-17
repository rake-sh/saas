require 'rails_helper'

describe 'account creation' do
	it 'allows user to create account' do
		visit root_path		
		click_link 'Create Account'

		fill_in "Name", with: "Rakesh"
		fill_in "Email", with: "rakesh.haridas@kvpcorp.com"
		fill_in "Password", with: "Admin@123$"
		fill_in "Password confirmation", with: "Admin@123$"
		fill_in "Subdomain", with: "test_subdomain"
		click_button 'Create Account'

		expect(page).to have_content('Account was successfully created.')
	end
end