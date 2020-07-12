# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_titel = '')
    base_titel = 'Instagram App'
    if page_titel.empty?
      base_titel
    else
      page_titel + ' | ' + base_titel
    end
  end
end
