import Vue from 'vue'
import VueRouter from "vue-router";

import DocumentView from '../components/document_view'
import FileUpload from '../components/file_upload_dialog'
import EditUser from '../components/edit_user'

Vue.use(VueRouter)

export const router = new VueRouter({
    routes: [
        {
            path: '/rediger-profil',
            component: EditUser
        }, {
            path: '/',
            component: DocumentView
        },
        {
            path: '/ny-signering',
            component: FileUpload
        }

    ]
})