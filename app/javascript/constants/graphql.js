import gql from "graphql-tag/src";

export const ALL_DOCUMENTS_QUERY = gql`
  query allDocuments {
    documents {
        id
        userId
        status
        filePath
    }
  }
`;