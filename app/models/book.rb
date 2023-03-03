# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  cover            :string
#  publication_date :date
#  synoposis        :text
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer
#
class Book < ApplicationRecord
  has_many(:genres, { :class_name => "Genre", :foreign_key => "book_id", :dependent => :nullify })

  has_many(:reviews, { :class_name => "Review", :foreign_key => "book_id", :dependent => :destroy })

  belongs_to(:author, { :required => true, :class_name => "Author", :foreign_key => "author_id" })

  has_many(:tbrs, { :class_name => "Tbr", :foreign_key => "book_id", :dependent => :destroy })

end
