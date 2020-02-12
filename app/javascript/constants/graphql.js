import gql from "graphql-tag/src";

export const ALL_DOCUMENTS_QUERY = gql`
  query Documents {
    documents {
        id
        status
        userId
        filePath
    }
  }
`