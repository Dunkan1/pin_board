require "rails_helper"
# require "/spec/support/spec_test_helper.rb"

feature 'User creates pin' do
  fixtures :pins, :users
  # given!(:pin) { Product.new(title: 'Widget X', description: 'This is a description.', price: 12.99, shipping_price: 2.95) }
  given!(:user) { User.first }
  given!(:pin) { Pin.first }
  # login(:user)
  
  
  scenario 'with valid input' do
    login_as(:user_, scope: :user)
    puts user.email
    puts pin.title

    visit new_pin_path # FALLA
    
    fill_in :description, with: pin.description
    fill_in 'title', with: pin.title
    # FALTA UPLOAD DE IMAGENES
    click_button :submit
  end
end
  