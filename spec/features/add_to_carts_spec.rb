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

  scenario "They see product detail page" do
    # ACT
    visit root_path
    page.first('article.product').find_link(text: 'Add').click

    # DEBUG / VERIFY
    # wait long enough for screen capture
    # sleep 2
    # save_screenshot
    within('.navbar') { expect(page).to have_content('My Cart (1)') }
  end

end
