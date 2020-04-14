<template>
    <span>
        <!-- Navigationdrawer as navigation -->
        <v-navigation-drawer
                v-if="$vuetify.breakpoint.mdAndUp"
                absolute
                permanent
                mini-variant
        >
        <v-list-item two-line>
            <v-list-item-content >
                <v-icon color="primary">mdi-face-profile</v-icon>
            </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list dense>
            <v-list-item
                    v-for="item in items"
                    :key="item.title"
                    :to="item.route"
                    active-class="primary--text"
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

    <!-- Bottom nav as navigation-->
    <v-row>
        <v-col
            lg="10"
            offset-lg="1"
            class="px-0"
        >
            <v-bottom-navigation
                    color="primary"
                    active-class="selected-item"
                    grow
                    class="justify-start elevation-3"
                    :fixed="$vuetify.breakpoint.mdAndDown"

            >
                <v-btn v-for="(item, k) in items" :key="k" :to="item.route" class="item">
                    <span>{{item.title}}</span>
                </v-btn>
                <v-spacer></v-spacer>
                <span v-if="$vuetify.breakpoint.mdAndUp" class="align-self-md-center float-right mr-12"><v-icon left color="primary">mdi-paper-roll-outline</v-icon>{{user.firstName}} {{user.lastName}}</span>
            </v-bottom-navigation>
        </v-col>
    </v-row>
    </span>

</template>
<script>
    import { logout } from '../network/vue-rails'

    export default {
        data(){
            return {
                items: [
                    {title: 'Oversikt', icon: "mdi-home", route: '/oversikt'},
                    {title: 'Dokumenter', icon: 'mdi-file-document', route: '/'},
                    {title: 'Arkiv', icon: "mdi-archive", route: '/arkiv'},
                    {title: 'Profil', icon: 'mdi-account', route: '/rediger-profil'},
                ],
                tab: null,
            }
        },
        methods: {
            logout
        },
        props: ['user']
    }
</script>

<style>
    .bc-color {
        background-color: #F6F7FD;
    }
    .selected-item{
        border-bottom: solid 2px;
    }

</style>