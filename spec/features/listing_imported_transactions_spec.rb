require "rails_helper"

feature "Listing previously imported transactions" do
  scenario "shows message when no files have yet been imported" do
    visit root_url
    expect(page).to have_content(I18n.t("import_sessions.none_exist"))
  end
end
