module Mutations
  class DeleteDocument < BaseMutation

    argument :document_id, ID, required: true

    def resolve(document_id:)
      document = Document.find(document_id)
      if document.destroy
        document_id
      end
    end
  end
end