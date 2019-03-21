class ProgrammingError < ApplicationRecord
	#search_field [:message, :cause,:title,:code]
	#quest_search_on :message, :cause, :title, :code
  #search_option :anywhere
  include PgSearch
  pg_search_scope :search_by_information, against: [:message, :cause,:title,:code], using: :tsearch

  belongs_to :user
end
