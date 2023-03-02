# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord

  has_many(:books, { :class_name => "Book", :foreign_key => "author_id", :dependent => :destroy })

  has_many(:book_genres, { :through => :books, :source => :genres })

end
