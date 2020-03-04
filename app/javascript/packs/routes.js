import Vue from 'vue'
import VueRouter from "vue-router";

import DocumentList from '../components/document-list'
import Signup from '../components/signup_form'

Vue.use(VueRouter)

export const router = new VueRouter({
    routes: [
        {
            path: '/signup',
            component: Signup
        }, {
            path: '/documents',
            component: DocumentList
        }

    ]
})