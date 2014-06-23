require "rails_helper"

feature "Importing a file", js: true do
  given(:valid_data_file) { File.expand_path("../resources/example_input.tab", __dir__) }
  given(:invalid_data_file) { File.expand_path("../resources/botched_input.tab", __dir__) }

  before do
    visit root_path
  end

  scenario "shows the total gross amount of purchases and each line item" do
    select_and_import_file

    expect(page).to have_content(success_message)
    expect(page).to have_content("$95.00")

    expect(purchases.size).to eq(4)
  end

  scenario "shows an error message if the input file is invalid" do
    select_and_import_file(invalid_data_file)
    expect(page).to have_content(failure_message)
  end

  def select_and_import_file(data_file = valid_data_file)
    within("#new_import_session") do
      attach_file "import_session[data_file]", data_file
      click_button import_action
    end
  end

  def purchases
    page.all(".purchase")
  end

  def import_action
    I18n.t("import_sessions.import_action")
  end

  def success_message
    I18n.t("import_sessions.success")
  end

  def failure_message
    I18n.t("import_sessions.failure")
  end
end
