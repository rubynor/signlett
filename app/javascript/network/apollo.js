// Configuration for apollo
import {HttpLink} from "apollo-link-http";
import {InMemoryCache} from "apollo-cache-inmemory";
import {ApolloClient} from "apollo-client";
import { setContext } from 'apollo-link-context';
import VueApollo from "vue-apollo";

import {getCsrfToken} from "./vue-rails";

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

const cache = new InMemoryCache();

export const apolloClient = new ApolloClient({
    link: authLink.concat(httpLink),
    cache: cache
});

export const apolloProvider = new VueApollo({
    defaultClient: apolloClient,
    defaultOptions: {
        $loadingKey: 'loading'
    }
})
