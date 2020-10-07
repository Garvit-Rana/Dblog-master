class UsersController < ApplicationController
def search
    term = params[:term]

    users = User.where('email like ?', "%#{term}%")

    data = []
    users.each do |u|
      data << {
        id: u.id,
        label: u.email,
        value: u.email
      }
    end

    return render json: data, status: 200


  end
end
