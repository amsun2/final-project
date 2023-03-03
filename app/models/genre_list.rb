# == Schema Information
#
# Table name: genre_lists
#
#  id         :integer          not null, primary key
#  genre_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GenreList < ApplicationRecord
end
