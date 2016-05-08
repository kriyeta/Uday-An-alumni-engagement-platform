module ApplicationHelper
  ActionView::Base.default_form_builder = StandardBuilder

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def display_events(events)
    html_to_render="<hr>"
    puts @events.size.to_s.red
    if events.blank?
      html_to_render << "<h4 class='media-heading'> There is no events to show</h4><hr>"
    end
    for event in events
      html_to_render << "<li class='media'>"
      if event.image_path.blank?
        html_to_render << "<a class='pull-left' href='#'>"+image_tag('events/events'+rand(1..2).to_s+'.jpg', :alt => 'Event', :class => 'img-responsive media-object', :style => 'align:center;')+"</a>"
      else
        html_to_render << "<a class='pull-left' href='#'>"+image_tag(event.image_path, :alt => 'Event', :class => 'img-responsive', :style => 'align:center;')+"</a>"
      end
      if !event.title.blank?
        html_to_render << "<div class='media-body'>"+"<h4 class='media-heading'>"+event.title.truncate_words(20, omission: ' ')
      else
        html_to_render << "<div class='media-body'>"+"<h4 class='media-heading'> Event"
      end
      if event.created_at >= Date.today-7
        html_to_render << "&nbsp; <span class='label label-warning'>New</span>"
      end
      html_to_render << "</h4>"
      if !event.summary.blank?
        html_to_render << "<p>" + event.summary.truncate_words(35, omission: "<a style='text-decoration:none' href='#'> &nbsp;&nbsp;Read More>></a>") +"</p>"
      end
      if !event.event_date.blank?
        html_to_render << "<strong> Event Date: </strong>"+event.event_date.strftime('%d-%b-%Y')
      end
      if !event.event_from_time.blank?
        html_to_render << "<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From: </strong>"+event.event_from_time.strftime('%I:%M%p')
      end
      if !event.event_to_time.blank?
        html_to_render << "<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To: </strong>"+event.event_to_time.strftime('%I:%M%p')
      end
      html_to_render << "</div></li><hr>"
    end
    html_to_render.html_safe
  end
end
