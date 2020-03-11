// Configuration for apollo
import {HttpLink} from "apollo-link-http";
import {InMemoryCache} from "apollo-cache-inmemory";
import {ApolloClient} from "apollo-client";
import { setContext } from 'apollo-link-context';
import VueApollo from "vue-apollo";
import {getCsrfToken} from "./vue-rails";
import {ApolloLink} from "apollo-link";
import {createUploadLink} from "apollo-upload-client";
import {BatchHttpLink} from "apollo-link-batch-http";

const authLink = setContext((_, { headers }) => {
   return {
       headers: {
           ...headers,
           'X-CSRF-Token': getCsrfToken(),
       }
   }
});

const httpLink = new HttpLink({
    uri: 'http://localhost:3000/graphql',
    credentials: 'same-origin'
});

const options = {
    uri: 'http://localhost:3000/graphql',
    credentials: 'include'
}

const httpLinkUpload = ApolloLink.split(
    op => op.getContext().hasUpload,
    createUploadLink(options),
    new HttpLink(options)
)

const cache = new InMemoryCache();

const apolloClient = new ApolloClient({
    link: authLink.concat(httpLinkUpload),
    cache: cache
});

export const apolloProvider = new VueApollo({
    defaultClient: apolloClient,
})
