
class EditIssueSection < SitePrism::Section

# -- field --
  element :type_field, '#issuetype-field:not([disabled])'
  element :summary_field, '#summary:not([disabled])'

# -- drop-down item --
  element :type_list_active_item, '.aui-list-item.active'
  elements :type_list, '#issuetype-suggestions .aui-list-item'

# -- button --
  element :submit_button, '#edit-issue-submit'

end

class IssuePage < SitePrism::Page

  set_url "https://jira.atlassian.com/browse{/issue_key}"

# -- section --
  section :edit_issue_section, EditIssueSection, '#edit-issue-dialog'

# -- field --
  element :type_field, '#type-val'
  element :summary_field, '#summary-val'

# -- button --
  element :edit_issue_button, '#edit-issue'

  def edit_issue( summary = 'edited summary', type = 'improvement' )

    edit_issue_button.click

    edit_issue_section.summary_field.set summary
    edit_issue_section.type_field.set type
    edit_issue_section.wait_until_submit_button_visible
    edit_issue_section.submit_button.click
    wait_until_edit_issue_section_invisible

  end

end