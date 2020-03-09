import Vue from 'vue/dist/vue.esm'
import vuetify from "../plugins/vuetify";
import 'vuetify/dist/vuetify.min.css'
import VueApollo from 'vue-apollo'
import store from "../store"
import { router } from "./routes";
// Components
import App from '../components/app.vue'
import LoginForm from '../components/login_form'
import SignupForm from '../components/signup_form'

Vue.component('app', App)
Vue.component('login', LoginForm)
Vue.component('signup', SignupForm)

Vue.use(VueApollo)

import { apolloProvider } from '../network/apollo'

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        store,
        el: 'div.vue-target',
        apolloProvider,
        vuetify,
        router
    })
})