Specs:

[x] Using Ruby on Rails for the project
  Generated the app using $ rails new rails-movie-reviews

[x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  A user has_many :movies (admin only)

[x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  A movie belongs_to :user (admin only)

[x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  An actor has_many :movie_actors
  An actor has_many :movies, through: :movie_actors
  A movie has_many :movie_actors
  A movie has_many :actors, through: :movie_actors

[x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  A user has_many :reviews
  A user has_many :movies, through: :reviews
  A movie has_many :reviews
  A movie has_many :users, through: :reviews

[x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  A review has a title, content, and a rating that is submitted by the user

[x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  User:
    validates_presence_of :username, :email
    validates :username, :email, :uniqueness => true
  Review:
    validate :one_review_per_user_per_movie
    validates_presence_of :rating, :title, :content
  Movie:
    validates_presence_of :title, :synopsis, :year
  Actor:
    validates_presence_of :first_name
  Genre:
    validates_presence_of :name

[x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Review
      Method: scope :newest_to_oldest, -> { order(:created_at => :desc) }
      URL: /reviews => in the reviews controller Review.newest_to_oldest is used to order the array and display the reviews in that order.

[x] Include signup (how e.g. Devise)
  Users#new provides a form for a user to create an account. This posts to users#create, which creates a user and sets the session[:user_id] = @user.id.

[x] Include login (how e.g. Devise)
  Sessions#new provides a login form for the user. This posts to sessions#create, which looks for the user in the database. If the user is found this action also confirms the user's password. If the password is correct it sets the session[:user_id] = @user.id.

[x] Include logout (how e.g. Devise)
  The logout link directs to the sessions#destroy action. This action clears the session and redirects to the root path.

[x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Google Omniauth

[x] Include nested resource show or index (URL e.g. users/2/recipes)
  movies/1/reviews

[x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  movies/1/reviews/new

[x] Include form display of validation errors (form URL e.g. /recipes/new)
  Validations require necessary form fields to be filled out. If a field does not meet the required validation it is assigned the field_with_errors class and the form is not submitted. Any errors appear at the top of the form through the errors partial in the layouts folder.

Confirm:

[ ] The application is pretty DRY
[x] Limited logic in controllers
[ ] Views use helper methods if appropriate
[ ] Views use partials if appropriate
