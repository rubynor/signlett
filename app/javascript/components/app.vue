<template>
  <v-app :style="{background: $vuetify.theme.themes[isDark].background}">
    <ApolloQuery
            :query="require('../graphql/LoggedInUser.gql')"
    >
      <template v-slot="{ result: {error, data} }">
        <span
          v-if="data && data.userLoggedIn"
          v-bind="user = data.userLoggedIn"
        >
          <navigation
                :user="user"
          />
        </span>

      </template>
    </ApolloQuery>
    <router-view></router-view>
  </v-app>
</template>

<script>
import DocumentList from './document-list'
import Navigation from './navigation'

import DocumentQuery from '../graphql/DocumentForUser.gql'

export default {
  data(){
    return {
    }
  },
  components: {
    DocumentList,
    Navigation
  },
  apollo: {
    documentForUser: {
      query: DocumentQuery
    }
  },
  computed: {
    isDark(){ return (this.$vuetify.theme.dark) ? 'dark' : 'light'}
  }
}
</script>

<style scoped lang="scss">

  .bc-color {
    background-color:#FAFAFA;
  }

</style>
