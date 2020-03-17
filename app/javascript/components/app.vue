<template>
  <v-app class="bc-color">
    <navigation/>
    <router-view></router-view>
  </v-app>
</template>

<script>
import DocumentList from './document-list'
import Navigation from './navigation'

export default {
  data(){
    return {
    }
  },
  components: {
    DocumentList,
    Navigation
  },
}
</script>

<style scoped>
  .bc-color {
    background-color: #F6F7FD;
  }

</style>
