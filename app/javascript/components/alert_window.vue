<template>
    <v-alert
            :value="alertContent.show"
            text
            :type="alertContent.type"
            border="left"
            transition="scale-transition"
    >
        {{ alertContent.message }}
    </v-alert>
</template>

<script>
    export default {
        data(){
            return {
                alertWindow: false,
                alertType: ''
            }
        },
        props: ['alertContent']
    }
</script>