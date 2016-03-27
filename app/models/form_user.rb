class FormUser < User
  attr_accessor :current_password

  validates_presence_of :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: Devise.password_length, allow_blank: true

  include PgSearch
  pg_search_scope :quick_search,
                  against: [
                      [:name, 'A'],
                      [:email, 'A'],
                      [:gender, 'C'],
                      [:passout_year, 'A'],
                      [:passout_class, 'C'],
                      [:mobile, 'A'],
                      [:current_city, 'A'],
                      [:current_country, 'A'],
                      [:current_zipcode, 'A'],
                      [:current_address, 'B'],
                      [:permanent_address, 'C'],
                      [:current_occupation_status, 'C'],
                      [:current_occupation_status_details, 'A']
                  ],
                  :using => {
                      :tsearch => {:prefix => true, :any_word => true},
                      :trigram => {}
                  }

  def password_required?
    return false if email.blank?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end
end