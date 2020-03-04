import Vuex from 'vuex';
import Vue from "vue";
import DocumentList from '../components/document-list'

// Load vuex
Vue.use(Vuex);

// Create store
export default new Vuex.Store({
    modules: {
        DocumentList
    }
});