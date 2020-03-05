<template>
  <v-app>
    <v-navigation-drawer
    absolute
    permanent
    color="blue-grey darken-2"
    expand-on-hover
    dark
    >
      <v-list-item two-line>
        <v-list-item-content>
          <v-list-item-title>Ove Simon Wernersson</v-list-item-title>
          <v-list-item-subtitle>Innlogget</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :to="item.route"
          @click=""
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title> {{ item.title }} </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item
          @click="logout"
        >
          <v-list-item-icon>
            <v-icon>mdi-logout-variant</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>
              Logg ut
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

    </v-navigation-drawer>
    <file-upload/>
    <router-view></router-view>
  </v-app>
</template>

<script>
import DocumentList from './document-list'
import FileUpload from './file_upload'
import { logout } from "../network/vue-rails";

export default {
  data(){
    return {
      items: [
        {title: 'Mine dokumenter', icon: 'mdi-home-city', route: '/documents'},
        {title: 'Profil', icon: 'mdi-account', route: '/signup'},
      ]
    }
  },
  components: {
    DocumentList,
    FileUpload
  },
  methods: {
    logout,
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
