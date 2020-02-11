<template>
  <v-app>
    <v-app-bar
               dense
              shrink-on-scroll
              app>
      <v-app-bar-title class="headline text-uppercase">
        <span>Vuetify</span>
        <span class="font-weight-lightweight">MATERIAL DESIGN</span>
      </v-app-bar-title>
    </v-app-bar>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
