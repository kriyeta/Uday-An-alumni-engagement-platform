class Event < ActiveRecord::Base
  include PgSearch
  pg_search_scope :quick_search,
                  against: [
                      [:title, 'A'],
                      [:event_date, 'A'],
                      [:event_type, 'A'],
                      [:details, 'B'],
                      [:organizers, 'B'],
                      [:summary, 'C'],
                      [:venue, 'C'],
                      [:guests, 'C'],
                      [:target_audiance, 'C']
                  ],
                  :using => {
                      :tsearch => {:prefix => true, :any_word => true},
                      :trigram => {}
                  }
end
