require 'rails_helper'

# Story: As a user, I can go to a landing page.
RSpec.feature "UserContacts", type: :feature do
  context "Landing Page" do
    Steps "Goes to Landing Page" do
      Given "When I visit localhost 3000:" do
        visit "/"
      end
      Then "I will see Welcome!"  do
        expect(page).to have_content("Welcome!")
      end
      Then "I can enter my contact info" do
        fill_in 'first_name', with: 'John'
        fill_in 'last_name', with: 'Wick'
        fill_in 'email', with: 'johnnyW@gmail.com'
        fill_in 'address', with: '123 Main St.'
        click_button 'Create Contact'
      end
      Then "I recieve an message saying contact was saved" do
        expect(page).to have_content('Contacts successfully saved!')
        expect(page).to have_content('John')
        expect(page).to have_content('Wick')
        expect(page).to have_content('johnnyW@gmail.com')
        expect(page).to have_content('123 Main St.')
      end
      Then "I can list all Contacts" do
        expect(page).to have_content('')
      end
    end
  end
end
