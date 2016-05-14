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
                      [:creator, 'B']
                  ],
                  associated_against: {agenda_initiators: [:initiator, 'C'], comments: [[:comment, 'C'], [:author, 'C']]},
                  :using => {
                      :tsearch => {:prefix => true, :any_word => true},
                      :trigram => {}
                  }
end
