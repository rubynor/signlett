<template>
    <v-navigation-drawer
            absolute
            permanent
            color="green lighten-2"
            expand-on-hover
            dark
    >
        <v-list-item two-line>
            <v-list-item-content>
                <v-list-item-title>{{user.firstName}} {{user.lastName}}</v-list-item-title>
                <v-list-item-subtitle>Innlogget</v-list-item-subtitle>
            </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list dense>
            <v-list-item
                    v-for="item in items"
                    :key="item.title"
                    :to="item.route"
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
</template>

<script>
    import { logout } from '../network/vue-rails'

    export default {
        data(){
            return {
                items: [
                    {title: 'Mine dokumenter', icon: 'mdi-file-document', route: '/'},
                    {title: 'Ny signering', icon: 'mdi-file-document-box-plus', route: '/ny-signering'},
                    {title: 'Profil', icon: 'mdi-account', route: '/signup'},
                ],
            }
        },
        methods: {
            logout
        },
        props: ['user']
    }
</script>