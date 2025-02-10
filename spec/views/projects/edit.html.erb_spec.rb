# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/edit', type: :view do
  let(:project) do
    Project.create!(
      owner: nil,
      name: 'MyString',
      status: 1
    )
  end

  before(:each) do
    assign(:project, project)
  end

  it 'renders the edit project form' do
    render

    assert_select 'form[action=?][method=?]', project_path(project), 'post' do
      assert_select 'input[name=?]', 'project[owner_id]'

      assert_select 'input[name=?]', 'project[name]'

      assert_select 'input[name=?]', 'project[status]'
    end
  end
end
