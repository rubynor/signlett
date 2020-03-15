<template>
    <span>
        <v-container
        class="mx-auto">
            <v-data-table
                    :headers="headers"
                    :items="documentForUser"
                    :items-per-page="5"
                    class="elevation-1"
                    loading-text="Laster inn.. Vennligst vent"
            >
                <template v-slot:item.actions="{ item }">
                    <v-btn
                        text
                        x-small
                        color="success"
                        :href="item.filePath"
                    >
                        Åpne dokument
                    </v-btn>
                </template>
            </v-data-table>
            <v-card>

            </v-card>
        </v-container>
    </span>
</template>

<script>
    import {DOCUMENT_FOR_USER} from "../constants/graphql";

    export default {
        name: 'DocumentList',
        data() {
            return {
                headers: [
                    {text: 'Dokument id', value: 'id'},
                    {text: 'Status signering', value: 'status'},
                    {text: 'Laget av', value: 'user.email'},
                    {text: 'Åpne dokument', value: 'actions', sortable: false}

                ],
                documentForUser: []

            }
        },
        methods: {
          openDocument(item){

          }
        },
        apollo: {
            documentForUser: {
                query: DOCUMENT_FOR_USER
            }
        }
    }
</script>