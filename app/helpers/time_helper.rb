module TimeHelper
  def timeago(time)
    content_tag(:span, time.iso8601, title: time.iso8601, class: 'timeago')
  end
end