import Vue from 'vue/dist/vue.esm'
import vuetify from "../plugins/vuetify";
import 'vuetify/dist/vuetify.min.css'

// Components
import App from '../components/app.vue'
Vue.component('app', App)



document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        el: 'div#vue-target',
        vuetify
    })
})