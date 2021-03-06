require 'spec_helper'

feature 'viewing peeps' do
  scenario 'i can view all peeps' do
    sign_up
    Peep.create(content: "this is a peep", user_id: User.first.id)
    visit('/peeps')
    expect(page.status_code).to(eq(200))
    within 'ul#peeps' do
    expect(page).to(have_content('this is a peep'))
    end
  end

  scenario 'peep displays time' do
    sign_up
    peep = Peep.create(content: "this is a peep", user_id: User.first.id)
    visit('/peeps')
    expect(page).to(have_content("#{peep.time}"))
  end
end
