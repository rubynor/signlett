<template>
  <v-app>
    <v-navigation-drawer
    absolute
    permanent
    color="blue-grey darken-2"
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
          @click=""
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title> {{ item.title }} </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <document-list />
  </v-app>
</template>

<script>
import DocumentList from './document-list'

export default {
  data: function () {
    return {
      items: [
        {title: 'Mine dokumenter', icon: 'mdi-home-city'},
        {title: 'Profil', icon: 'mdi-account'},
        {title: 'Logg ut', icon: 'mdi-logout-variant'}
      ]
    }
  },
  components: {
    DocumentList
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
