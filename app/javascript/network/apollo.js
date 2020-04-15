// Configuration for apollo
import {HttpLink} from "apollo-link-http";
import {InMemoryCache} from "apollo-cache-inmemory";
import {ApolloClient} from "apollo-client";
import { setContext } from 'apollo-link-context';
import VueApollo from "vue-apollo";
import {getCsrfToken} from "./vue-rails";
import {ApolloLink} from "apollo-link";
import {createUploadLink} from "apollo-upload-client";
import gql from 'graphql-tag';

const authLink = setContext((_, { headers }) => {
   return {
       headers: {
           ...headers,
           'X-CSRF-Token': getCsrfToken(),
       }
   }
});


const options = {
    uri: '/graphql',
    credentials: 'include'
}

const httpLinkUpload = ApolloLink.split(
    op => op.getContext().hasUpload,
    createUploadLink(options),
    new HttpLink(options)
)

const cache = new InMemoryCache();

export const typeDefs = gql`
  type user {
    email: String!
    firstName: String!
    lastName: String!
    password: String!    
  }
`;

const apolloClient = new ApolloClient({
    link: authLink.concat(httpLinkUpload),
    cache: cache,
    typeDefs,
    resolvers: {}
});

export const apolloProvider = new VueApollo({
    defaultClient: apolloClient,
})

