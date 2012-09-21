module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Build <li> nav link element with css 'active' class set correctly.
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  # Helper to make will_paginate produce ZURB-worthy markup.
  # Copied from https://gist.github.com/1586384
  # Changed class name.  Changed CSS class name 'active' to 'current' since that's what ZURB uses.
  class ZurbLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected
 
    def html_container(html)
      tag(:ul, html, container_attributes)
    end
 
    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('current' if page == current_page)
    end
 
    def gap
      tag :li, link(super, '#'), :class => 'unavailable'
    end
 
    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('unavailable' unless page)].join(' ')
    end
  end
 
  def page_navigation_links(pages, classname='pagination')
    will_paginate(pages, :class => classname, :inner_window => 2, :outer_window => 0, :renderer => ZurbLinkRenderer, :previous_label => '&laquo;'.html_safe, :next_label => '&raquo;'.html_safe)
  end

end