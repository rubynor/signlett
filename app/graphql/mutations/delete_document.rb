module Mutations
  class DeleteDocument < BaseMutation

    argument :document_id, ID, required: true

    field :message, String, null: false

    def resolve(document_id:)
      document = Document.find(document_id)
      if document.destroy
        {message: "Document successfully deleted"}
      else
        {message: "Could not delete document"}
      end
    end
  end
end