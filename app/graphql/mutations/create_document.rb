module Mutations
  class CreateDocument < BaseMutation
    description "Mutation for creating document and its recipients"
    argument :file_path, String, required: true
    argument :email, [String], required: true
    argument :status, Integer, required: true

    field :document, Types::DocumentType, null: false
    field :recipient, Types::RecipientType, null: false
    field :errors, [String], null: false

    def resolve(email:, file_path:, status:)
      curr_user = context[:current_user]
      document = curr_user.documents.build(status: status, file_path: file_path)
      recipient = []
      email.each do |email|
        recipient = document.recipients.build(email: email)
      end
      
      if recipient.save
        {
            document: document,
            recipient: recipient,
            errors: []
        }
      else
        {
            document:  nil,
            recipient: nil,
            errors: recipient.errors.full_messages
        }
      end
    end
  end
end
