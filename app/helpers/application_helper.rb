module ApplicationHelper
  def status_widoku(boolean, options={})
    options[:true_text] ||= ''
    options[:false_text] ||= ''
    if boolean
      content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ok-circle')
    else
      content_tag(:span, options[:fase_text], :class => 'glyphicon glyphicon-ban-circle')
    end
  end
end
