<template>
    <span>
        <v-row>
            <v-col
                cols="10"
                offset-sm="1"
            >
                <span
                    class="display-1 font-weight-light"
                >
                    Mine dokumenter
                </span>
            </v-col>
        </v-row>
        <v-data-iterator
            :items="documentForUser"
        >
            <template v-slot:default="props">
                <v-row>
                    <v-col
                        cols="12"
                        sm="10"
                        offset-sm="1"
                        class=" elevation-1 pa-0 mt-5"

                    >
                        <v-row class="ma-0 grey--text text--lighten-1 pa-0">
                            <v-col
                                    cols="3"
                            >
                                Dokument
                            </v-col>
                            <v-col
                                    cols="3"
                            >
                                Størrelse
                            </v-col>
                            <v-col
                                    cols="3"
                            >
                                Status
                            </v-col>
                            <v-col
                                    cols="3"
                            >
                                Handlinger
                            </v-col>
                        </v-row>
                        <span
                          v-for="document in props.items"
                            :key="document.id"
                        >
                            <v-hover v-slot:default="{ hover }">
                                <div
                                    :class="{ 'on-hover': hover }"
                                    class="font-weight-light"
                                >
                                    <v-row class="ma-0 pa-0">
                                        <v-col
                                                cols="3"
                                        >
                                            {{capitalize(document.file.filename)}}
                                        </v-col>
                                        <v-col
                                                cols="3"
                                        >
                                            {{document.file.byteSize/1000}} kb
                                        </v-col>
                                        <v-col
                                                cols="3"
                                        >
                                            {{determineStatus(document.status)}}

                                        </v-col>
                                        <v-col
                                                cols="3"
                                        >
                                            {{document.file.filename}}
                                        </v-col>
                                    </v-row>
                                </div>
                            </v-hover>
                        </span>
                    </v-col>
                </v-row>
            </template>
        </v-data-iterator>
    </span>
</template>

<style>
    .on-hover{
        border: solid 1px rgba(187,222,251,0.8) !important;
        -moz-box-shadow: 0 0 5px #ccc;
        -webkit-box-shadow: 0 0 5px #ccc;
        box-shadow: 0 0 5px #ccc;
    }
</style>

<script>
    import {DOCUMENT_FOR_USER} from "../constants/graphql";
    import { capitalize } from "../network/vue-rails";

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
            capitalize,
            determineStatus(status){
              switch (status) {
                case 0: return "Venter på signering";
                    break;
                case 1:
                    return "Delvis signert"
                    break;
                case 2:
                    return "Signert"
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