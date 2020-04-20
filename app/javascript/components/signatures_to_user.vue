<template>
    <v-row>
        <v-col
            cols="10"
            offset="1"
            class="pa-0 mt-5"
        >
            <v-card tile>
                <ApolloQuery
                        :query="require('../graphql/RecipientForUser.gql')"
                >
                    <template v-slot="{ result: {error, data} }">
                        <div v-if="data && data.userAsRecipient" v-bind="recipients = data.userAsRecipient">
                            <v-card-text class="ma-0 pa-0">
                                <v-list two-line subheader v-if="recipients.length > 0">
                                    <v-list-item
                                        v-for="recipient in recipients"
                                        :key="recipient.id"
                                        @click=""
                                    >
                                        <v-list-item-avatar>
                                            <v-icon x-large color="secondary">mdi-folder</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-subtitle>Filnavn</v-list-item-subtitle>
                                            <v-list-item-title class="text-capitalize">{{recipient.document.file.filename}}</v-list-item-title>
                                            <v-list-item-subtitle>{{recipient.createdAt}}</v-list-item-subtitle>
                                        </v-list-item-content>
                                        <v-list-item-content>
                                            <v-list-item-subtitle>Fra</v-list-item-subtitle>
                                            <v-list-item-title>{{recipient.document.user.email}}</v-list-item-title>
                                            <v-list-item-subtitle>{{recipient.createdAt}}</v-list-item-subtitle>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn refs="downloadFile" icon :href="recipient.document.filePath">
                                                <v-icon>mdi-file-download</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                    </v-list-item>
                                </v-list>
                                    <h1 v-if="recipients.length <= 0" class="pa-4">Ingen signaturer</h1>
                            </v-card-text>
                        </div>
                        <div v-if="error">
                            <AlertWindow
                                    :alert-content="alertObject = { message: error, type: 'error', show: true}"
                            />
                        </div>
                    </template>
                </ApolloQuery>
            </v-card>
        </v-col>
    </v-row>

</template>

<script>
    import AlertWindow from './alert_window'

    export default {
        data() {
            return {
                alertObject: {
                    message: '',
                    type: '',
                    show: false
                }
            }
        },
        components: {
            AlertWindow
        },
        methods: {
        }
    }


</script>