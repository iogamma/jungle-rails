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

 scenario "They see product detail page" do
    # ACT
    visit root_path
    page.find_link(@category.products.first.name).click

    # DEBUG / VERIFY
    # wait long enough for screen capture
    # sleep 2
    # save_screenshot
    expect(page.has_css?('.product-detail'))
    expect(page).to have_content(@category.products.first.name)
  end
end
