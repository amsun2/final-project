# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#
class Genre < ApplicationRecord

  belongs_to(:book, { :required => true, :class_name => "Book", :foreign_key => "book_id" })

  has_one(:author_book_pair, { :through => :book, :source => :author })
end
