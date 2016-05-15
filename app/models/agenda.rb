class Agenda < ActiveRecord::Base
  has_many :comments
  has_many :likes
  has_many :agenda_initiators

  include PgSearch
  pg_search_scope :quick_search,
                  against: [
                      [:title, 'B'],
                      [:status, 'A'],
                      [:solutions, 'B'],
                      [:details, 'B']
                  ],
                  associated_against: {agenda_initiators: [[:name, 'C']], comments: [[:comment, 'C']]},
                  :using => {
                      :tsearch => {:prefix => true, :any_word => true},
                      :trigram => {}
                  }
end
