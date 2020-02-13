import { ApolloClient } from 'apollo-client'
import { HttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import Vue from 'vue/dist/vue.esm'
import vuetify from "../plugins/vuetify";
import 'vuetify/dist/vuetify.min.css'
import VueApollo from 'vue-apollo'

// Components
import App from '../components/app.vue'
import LoginForm from '../components/login_form'
import SignupForm from '../components/signup_form'
Vue.component('app', App)
Vue.component('login', LoginForm)
Vue.component('singup', SignupForm)

// Configuration for apollo
const httpLink = new HttpLink({
    uri: 'http://localhost:3000/graphql'
});

const cache = new InMemoryCache();

const apolloClient = new ApolloClient({
    link: httpLink,
    cache: cache
});


Vue.use(VueApollo)

const apolloProvider = new VueApollo({
    defaultClient: apolloClient,
    defaultOptions: {
        $loadingKey: 'loading'
    }
})

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        el: 'div.vue-target',
        apolloProvider,
        vuetify,

    })
})