module ApplicationHelper
    def full_title(page_titel = '')
      base_titel = 'Instagram App'
      if page_titel.any?
        page_titel + " | " + base_titel
      else
        base_titel
      end
    end
end
