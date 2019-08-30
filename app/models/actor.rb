class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates_presence_of :first_name

  scope :find_by_first_name, -> (first_name) { where("first_name LIKE ?", first_name) }
  scope :find_by_last_name, -> (last_name) { where("last_name LIKE ?", last_name) }


  def full_name
    if self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  # should sort actors alphabetically by their last name if they have a last name. if they don't have a last name it should use their first name
  def self.sorted_actors
    self.all.sort do |a, b|
      if a.last_name && b.last_name
        a.last_name <=> b.last_name
      elsif a.last_name && !b.last_name
        a.last_name <=> b.first_name
      elsif !a.last_name && b.last_name
        a.first_name <=> b.last_name
      elsif !a.last_name && !b.last_name
        a.first_name <=> b.first_name
      end
    end
  end
  
  # # module ClassMethods
  #   def self.find_by_slug(slug)
  #     where { |name| name.slug == slug }
  #   end
  # # end
  #
  #   def self.find_by_name(first_name, last_name)
  #     where(:first_name => first_name).where(:last_name => last_name)
  #   end
  #
  #   # def self.find_by_first_name(first_name)
  #   #   where(:first_name => first_name)
  #   # end
  #   #
  #   # def self.find_by_search(name)
  #   #   where(:first_name.include?(name))
  #   # end
  #
  # # module InstanceMethods
  #   def slug
  #     self.full_name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
  #   end
  # # end

end
