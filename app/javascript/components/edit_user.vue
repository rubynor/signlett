<template>
        <v-container>
            {{userLoggedIn}}
        </v-container>
</template>

<script>
    import userLocalQuery from '../graphql/UserLocal.gql'

    export default {
        data() {
            return {
                userLoggedIn: [],
            }
        },
        methods: {

        },
        apollo: {
            userLoggedIn: {
                query: userLocalQuery
            }
        }
    }
</script>