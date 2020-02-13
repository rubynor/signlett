<template>
    <span>
        <v-container>
            <v-data-table
                    :headers="headers"
                    :items="documents"
                    :items-per-page="5"
                    class="elevation-1"
                    loading
                    loading-text="Laster inn.. Vennligst vent"
            ></v-data-table>
        </v-container>
    </span>
</template>

<script>
    import { ALL_DOCUMENTS_QUERY } from "../constants/graphql";
    import gql from 'graphql-tag'
    export default {
        name: 'DocumentList',
        data() {
            return {
                headers: [
                    {text: 'Dokument id', value: 'id'},
                    {text: 'Status signering', value: 'status'},
                    {text: 'Laget av', value: 'userId'},
                    {text: 'Åpne dokument', value: 'filePath'},

                ],
                documents: []

            }
        },
        apollo: {
            documents: {
                query: ALL_DOCUMENTS_QUERY
            }
        }
    }
</script>