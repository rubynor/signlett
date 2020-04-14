import Vue from 'vue'
import VueRouter from "vue-router";

import DocumentView from '../components/document_view'
import EditUser from '../components/edit_user'
import Overview from '../components/overview'

Vue.use(VueRouter)

export const router = new VueRouter({
    routes: [
        {
          path: '/oversikt',
          component: Overview
        },
        {
            path: '/rediger-profil',
            component: EditUser
        }, {
            path: '/',
            component: DocumentView
        },

    ]
})