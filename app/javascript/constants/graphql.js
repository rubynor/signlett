import gql from "graphql-tag/src";

/***
 *
 * Local queries for application
 *
 * */

export const LOCAL_USER = gql`
    {
    userLoggedIn @client{
        id
        email
        firstName
        lastName
        }
    }
`

export const LOCAL_EVENT = gql`
    {
    userLoggedIn @client{
        id
        email
        firstName
        lastName
        }
    }
`

export const LOCAL_DOCUMENT = gql`
    {
        documentForUser @client{
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
            recipient{
               id
               email
               createdAt
               updatedAt
               signed
            }
        }
    }
`

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


