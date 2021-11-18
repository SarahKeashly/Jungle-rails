require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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
  # page.all(".product .actions a")[0].click

  scenario "They select a product" do
    # ACT
    visit root_path
    # first('.actions > a').click
    first('.actions').find(:link, "Details").trigger(:click)

    # expect(page).to have_css 'article.product-detail', count: 1

    sleep 1 

    # DEBUG
    # 
    save_screenshot

    # VERIFY
    # expecting it to go to the individual and have the breadcrumb of Apparel >> in the header
    expect(page).to have_selector 'h1', text: "Apparel »"
  end

end


