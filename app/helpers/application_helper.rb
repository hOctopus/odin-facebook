module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def find_title(page_title, default)
    page_title.empty? ? default : page_title
  end
end
