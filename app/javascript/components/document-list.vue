<template>
    <span>
        <v-container>
            <v-data-table
                    :headers="headers"
                    :items="allDocuments"
                    :items-per-page="5"
                    class="elevation-1"
            ></v-data-table>
        </v-container>
    </span>
</template>

<script>
    import { ALL_DOCUMENTS_QUERY } from "../constants/graphql";

    export default {
        data() {
            return {
                headers: [
                    {text: 'Dokument id', value: 'id'},
                    {text: 'Status signering', value: 'status'},
                    {text: 'Laget av', value: 'user_id'},
                    {text: 'Åpne dokument', value: 'file_path'},

                ],
                allDocuments: [],
                loading: 0

            }
        },
        apollo: {
            allDocuments: {
                query: ALL_DOCUMENTS_QUERY
            }
        }
    }
</script>