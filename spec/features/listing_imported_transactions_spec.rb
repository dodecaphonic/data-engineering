require "rails_helper"

feature "Listing previously imported transactions" do
  given(:admin) { create_admin }
  before do
    visit root_url
    login_with admin.email, "password"
  end

  scenario "shows message when no files have yet been imported" do
    visit root_url
    expect(page).to have_content(I18n.t("import_sessions.none_exist"))
  end

  scenario "list import sessions" do
    create_import_session(admin)
    visit root_url
    expect(all(".import-session").size).to eq(1)
  end  
end
