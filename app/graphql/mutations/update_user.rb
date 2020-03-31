module Mutations
  class UpdateUser < BaseMutation

    argument :id, ID, required: true
    argument :email, String, required: true
    argument :password, String, required: false
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    type Types::UserType

    def resolve(id:, email:, password:, first_name:, last_name:)
      user = User.find_by_email(email)
      if password != ""
        user.update!(email: email,
                     password: password,
                     first_name: first_name,
                     last_name: last_name)
      else
        user.update!(email: email,
                     first_name: first_name,
                     last_name: last_name)
      end

      user
    end
  end
end