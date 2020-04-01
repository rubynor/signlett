import Vue from 'vue'
import Vuetify from "vuetify"
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify);

const opts = {
    theme: {
        themes: {
            dark: {
                primary: '#81C784',
                secondary: '#64B5F6',
                accent: '#607d8b',
                error: '#E57373',
                warning: '#ff9800',
                info: '#03a9f4',
                success: '#7dde76',
                anchor: '#ff0080',
                background: '#ffffff',
                sidemenu: '#3B3F53',
                whiteTransparent: 'rgba(255, 255, 255, 0.7)'
            },
            light: {
                primary: '#81C784',
                secondary: '#64B5F6',
                accent: '#607d8b',
                error: '#E57373',
                warning: '#ff9800',
                info: '#03a9f4',
                success: '#7dde76',
                anchor: '#ff0080',
                background: '#ffffff',
                sidemenu: '#3B3F53'
            }
        }
    }
};

export default new Vuetify(opts)