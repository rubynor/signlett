import Vue from 'vue/dist/vue.esm'
import vuetify from "../plugins/vuetify";
import 'vuetify/dist/vuetify.min.css'


// Components
import App from '../components/app.vue'
import LoginForm from '../components/login_form'
import SignupForm from '../components/signup_form'
Vue.component('app', App)
Vue.component('login', LoginForm)
Vue.component('singup', SignupForm)




document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        el: 'div.vue-target',
        vuetify
    })
})