require 'rails_helper'


RSpec.describe ActorsController, :type => :controller do

  it do
    params = {
      :actor => {
        :first_name => "John",
        :last_name => "Doe",
      }
    }

    should permit(:first_name, :last_name).for(:create, params: params).on(:actor)

  end


  # it { should permit(:first_name, :last_name).for(:create, params: params).on(:actor) }

end
