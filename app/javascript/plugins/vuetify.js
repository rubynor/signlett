import Vue from 'vue'
import Vuetify from "vuetify"
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify);

const opts = {
    theme: {
        root: true,
        themes: {
            dark: {
                primary: '#AB47BC',
                secondary: '#64B5F6',
                accent: '#607d8b',
                error: '#E57373',
                warning: '#ff9800',
                info: '#03a9f4',
                success: '#7dde76',
                anchor: '#ffffff',
                background: 'rgba(0,0,0,0.96)',
                sidemenu: '#3B3F53',
                whiteTransparent: '#fff'
            },
            light: {
                primary: '#81C784',
                secondary: '#64B5F6',
                accent: '#607d8b',
                error: '#E57373',
                warning: '#ff9800',
                info: '#03a9f4',
                success: '#7dde76',
                anchor: '#000000',
                background: '#F6F8F8',
                sidemenu: '#3B3F53'
            }
        }
    }
};

export default new Vuetify(opts)