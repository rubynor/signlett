module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email:, password:)
      sign_in(email, password)
    end
  end
end