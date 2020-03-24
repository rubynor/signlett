import gql from "graphql-tag/src";

export const ALL_DOCUMENTS_QUERY = gql`
  query getDocuments{
    findAllDocuments {
        id
        createdAt
        updatedAt
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

// Query to get all documents for current user
export const DOCUMENT_FOR_USER = gql`
  query documents{
    documentForUser {
        id
        createdAt
        updatedAt
        user{
            firstName
            lastName
            email
        }
        status
        filePath
        file{
            filename
            contentType
            byteSize
        }
    }
  }
`;

export const CURRENT_USER = gql`
    query getUser{
        userLoggedIn {
            id
        }
    }
`;

export const UPLOAD_DOCUMENT = gql`
    mutation uploadDocument($email: String!, $status: Int!, $filePath: String!){
        createDocument(input: {
            email: $email
            status: $status
            filePath: $filePath
    })  {
            document{
                id
                filePath
                status
            }
            recipient{
                id
                email
                signed
            }
            errors
        }
    }   
`;

export const RECIPIENT_FOR_DOCUMENT = gql`
    query getRecipients {
        recipientForDocument{
            id
            email
            document{
                id
                createdAt
                updatedAt
                user{
                    firstName
                    lastName
                    email
                }
                status
                filePath
                file{
                    filename
                    contentType
                    byteSize
                }
            }
        }
    }
`


