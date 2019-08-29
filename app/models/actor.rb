class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  validates_presence_of :first_name

  def full_name
    if self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  # module ClassMethods
    def self.find_by_slug(slug)
      where { |name| name.slug == slug }
    end
  # end

    def self.find_by_name(first_name, last_name)
      where(:first_name => first_name).where(:last_name => last_name)
    end

    def self.find_by_first_name(first_name)
      where(:first_name => first_name)
    end

  # module InstanceMethods
    def slug
      self.full_name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
    end
  # end

end
