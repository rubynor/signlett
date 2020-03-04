import gql from "graphql-tag/src";

export const ALL_DOCUMENTS_QUERY = gql`
  query documents{
    findAllDocuments {
        id
        user{
            firstName
            lastName
            email
        }
        status
        filePath
    }
  }
`;