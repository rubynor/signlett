module Mutations
  class UpdateUser < BaseMutation

    argument :email, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    type Types::UserType

    def resolve(email:, password:, first_name:, last_name:)
      user = User.find_by_email(email)

      user.update!(email: email,
                   password: password,
                   first_name: first_name,
                   last_name: last_name)
      user
    end
  end
end