# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before(:each) do
    assign(:project, Project.create!(
                       owner: nil,
                       name: 'Name',
                       status: 2
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
