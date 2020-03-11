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
            ></v-data-table>
            <v-card
            v-for="document in documentForUser"
            >
                <v-card-text>
                    <a :href="document.filePath">Åpne dokument</a>
                </v-card-text>
            </v-card>
        </v-container>
    </span>
</template>

<script>
    import {ALL_DOCUMENTS_QUERY, CURRENT_USER, DOCUMENT_FOR_USER} from "../constants/graphql";
    import gql from 'graphql-tag'
    export default {
        name: 'DocumentList',
        data() {
            return {
                headers: [
                    {text: 'Dokument id', value: 'id'},
                    {text: 'Status signering', value: 'status'},
                    {text: 'Laget av', value: 'user.email'},
                    {text: 'Åpne dokument', value: 'filePath'},

                ],
                documentForUser: []

            }
        },
        apollo: {
            documentForUser: {
                query: DOCUMENT_FOR_USER
            }
        }
    }
</script>