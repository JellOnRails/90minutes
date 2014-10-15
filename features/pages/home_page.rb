
class HomePage < SitePrism::Page

  set_url 'https://jira.atlassian.com'

# -- field --
  element :project_field, '#project-field:not([disabled])'
  element :issue_type_field, '#issuetype-field:not([disabled])'
  element :summary_field, '#summary:not([disabled])'
  element :search_field, '#quickSearchInput'

# -- drop-down item --
  elements :project_list, '.aui-list-item-link.aui-iconised-link'
  elements :issue_type_list, '.aui-list-item-link'

# -- button --
  element :create_button, '#create_link'
  element :create_issue_button, '#create-issue-submit'

# -- popup --
  element :success_message, '.issue-created-key.issue-link'

  def create_issue( project = 'A Test Project', type = 'bug', summary = 'site prism' )

    create_button.click

    project_field.set project
    project_list.first.click
    issue_type_field.set type
    issue_type_list.first.click
    summary_field.set summary

    create_issue_button.click

  end

  def save_issue_number

    wait_for_success_message
    success_message[ 'data-issue-key' ]

  end

  def search_issue( issue = 'test' )

    search_field.set issue
    search_field.native.send_keys( :enter )

  end
end