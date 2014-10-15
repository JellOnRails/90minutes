
# ==== GIVEN ====

Given /^I am logged as a (\w+) in jira system$/ do | user |
  @app.login_page.load
  @app.login_page.log_in_as( user )
end

# ==== WHEN ====

When /^I create new issue$/ do
  @app.home_page.load
  @app.home_page.create_issue
  @issue_key = @app.home_page.save_issue_number
end

When /^I edit current issue$/ do
  @app.issue_page.load issue_key: @issue_key
  @app.issue_page.edit_issue @summary = 'edited summary', @type = 'Improvement'
end

When /^I search for issue$/ do
  @app.home_page.load
  @app.home_page.search_issue @issue_key
end

# ==== THEN ====

Then /^I should see success message$/ do
  @app.home_page.should have_success_message
end

Then /^I should see updated fields in current issue$/ do
  @app.issue_page.type_field.text.should == @type
  @app.issue_page.summary_field.text.should == @summary
end

Then /^I should see current issue$/ do
  @app.home_page.current_url.should include @issue_key
end