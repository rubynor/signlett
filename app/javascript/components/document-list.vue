<template>
    <span>
        <v-data-table
        ></v-data-table>
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
          determineStatus(status){
              switch (status) {
                case 0: "mdi-alert";
                    break;
                case 1:
                    "mdi-progress-check"
                    console.log(status)

                    break;
                case 2:
                    "mdi-check-circle-outline"
                    console.log(status)
                    break;
                default:
                    break;
              }
          }
        },
        apollo: {
            documentForUser: {
                query: DOCUMENT_FOR_USER
            }
        }
    }
</script>