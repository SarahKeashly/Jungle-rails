require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
 
# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
  @category.products.create!(
    name:  Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel1.jpg'),
    quantity: 10,
    price: 64.99
)
  end
end

scenario "changes from My Cart (0) to to My Cart (1)" do

#ACT
visit root_path
# age.find(".fa-shopping-cart",  match: :first).clickp
page.all(".product .actions .button_to")[0].click

#DEBUG
save_screenshot

#VERIFY
expect(page).to have_css '.navbar-default .navbar-nav > li > a', text: "My Cart (1)"

end
end 

