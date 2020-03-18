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
            :items-per-page.sync="itemsPerPage"
            :page="page"
            :search="search"
            :sort-by="sortBy.toLowerCase()"
            hide-default-footer

        >
            <template v-slot:header>
                <v-row>
                    <v-col
                            cols="12"
                            sm="10"
                            offset-sm="1"
                            class="pa-0 mt-5 pl-0">
                         <span
                            class="mb-1 pa"
                            flat
                         >
                            <v-row>
                                <v-col
                                    lg="1"
                                >
                                    <template v-if="$vuetify.breakpoint.mdAndUp">
                                        <v-select
                                                flat
                                                v-model="sortBy"
                                                solo
                                                hide-details
                                                :items="keys"
                                                label="Sorter"
                                                color="grey lighten-3"
                                                class="elevation-3 tile"

                                        >
                                        </v-select>
                                     </template>
                                </v-col>
                                <v-col
                                    lg="3"
                                >
                                    <v-text-field
                                            v-model="search"
                                            clearable
                                            flat
                                            solo
                                            hide-details
                                            prepend-inner-icon="mdi-magnify"
                                            label="Søk"
                                            class="elevation-3 tile"
                                    >
                                    </v-text-field>
                                </v-col>
                            </v-row>
                        </span>
                    </v-col>
                </v-row>

            </template>
            <template v-slot:default="props">
                <v-row>
                    <v-col
                        cols="12"
                        sm="10"
                        offset-sm="1"
                        class=" elevation-3 pa-0 mt-5 bc-color"

                    >
                        <span
                          v-for="document in props.items"
                            :key="document.id"
                        >
                            <v-hover v-slot:default="{ hover }">
                                <div
                                    :class="{ 'on-hover': hover }"
                                    class="font-weight-light"
                                >
                                    <v-row class="ma-0 pa-0" :class="'status-' + document.status">
                                        <!-- Navn -->
                                        <v-col
                                        >
                                            <span class="text--secondary font-weight-thin">Dokument</span>
                                            <br>
                                            <span>{{capitalize(document.file.filename)}}</span>
                                        </v-col>
                                        <!-- Størrelse -->
                                        <v-col
                                        >
                                            <span class="text--secondary font-weight-thin">Størrelse</span>
                                            <br>
                                            {{document.file.byteSize/1000}} kb
                                        </v-col>
                                        <v-col

                                        >
                                            <span class="text--secondary font-weight-thin">Dato</span>
                                            <br>
                                            {{document.createdAt}}
                                        </v-col>
                                        <!-- Status -->
                                        <v-col
                                        >
                                            <span class="text--secondary font-weight-thin">Status</span>
                                            <br>
                                            <v-chip
                                                outlined
                                                :color="determineStatus(document.status).color"
                                                dark
                                            >
                                                <v-icon left>{{determineStatus(document.status).icon}}</v-icon>
                                                {{determineStatus(document.status).text}}
                                            </v-chip>
                                        </v-col>
                                        <v-col
                                        >
                                            <span class="text--secondary font-weight-thin">Handlinger</span>
                                            <br>
                                            <v-tooltip
                                                    bottom
                                            >
                                                <template v-slot:activator="{ on }">
                                                    <v-btn
                                                            v-on="on"
                                                            icon
                                                            color="green lighten-2"
                                                            :href="document.filePath"
                                                    >
                                                        <v-icon>mdi-download</v-icon>
                                                    </v-btn>
                                                </template>
                                                <span>Last ned dokument</span>
                                            </v-tooltip>
                                             <v-tooltip
                                                     bottom
                                             >
                                                <template v-slot:activator="{ on }">
                                                    <v-btn
                                                            v-on="on"
                                                            icon
                                                            color="blue lighten-2">
                                                        <v-icon>
                                                            mdi-pen
                                                        </v-icon>
                                                    </v-btn>
                                                </template>
                                                <span>Rediger dokument</span>
                                            </v-tooltip>
                                             <v-tooltip
                                                     bottom
                                             >
                                                <template v-slot:activator="{ on }">
                                                    <v-btn
                                                            v-on="on"
                                                            icon
                                                            color="red lighten-2"
                                                            @click="deleteDocument(document.id)">
                                                        <v-icon>mdi-trash-can</v-icon>
                                                    </v-btn>
                                                </template>
                                                <span>Slett dokument</span>
                                            </v-tooltip>
                                        </v-col>
                                    </v-row>
                                </div>
                            </v-hover>
                        </span>
                    </v-col>
                </v-row>
            </template>
            <template v-slot:footer>
                <v-row>
                    <v-col
                        cols="12"
                        lg="10"
                        offset-sm="1"
                        class="mt-5 pa-0 mt-5 pl-0"
                    >
                        <v-row>
                            <v-col
                                sm="1"
                            >
                                <v-select
                                        solo
                                        class="tile"
                                        v-model="itemsPerPage"
                                        :items="itemsPerPageArray"
                                >
                                </v-select>
                            </v-col>
                            <v-col
                                    lg="11">
                              <v-pagination v-model="page" :length="numberOfPages" class="mt-5 tile"></v-pagination>
                            </v-col>
                            </v-row>
                    </v-col>
                </v-row>
            </template>
        </v-data-iterator>
    </span>
</template>

<style scoped>
    .on-hover{
        -moz-box-shadow: 0 0 10px rgba(187,222,251,0.9);
        -webkit-box-shadow: 0 0 10px rgba(187,222,251,0.9);
        box-shadow: 0 0 10px rgba(187,222,251,0.9);
    }
    .elevation-custom{
        -moz-box-shadow: 4px 4px 8px rgba(0,0,0,0.3);
        -webkit-box-shadow: 4px 4px 8px rgba(0,0,0,0.3);
        box-shadow: 4px 4px 8px rgba(0,0,0,0.3);
    }
    .tile {
        border-radius: 0px;
    }
    .bc-color{
        background-color: white;
    }
    .status-0 {
        border-left: solid 3px #E57373;
    }
    .status-1 {
        border-left: solid 3px #FFB74D;
    }
    .status-2 {
        border-left: solid 3px #81C784;
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
                documentForUser: [],
                itemsPerPageArray: [4, 8, 12],
                itemsPerPage: 4,
                page: 1,
                search: '',
                filter: {},
                sortDesc: false,
                sortBy: 'filename',
                keys: [
                    'Filnavn',
                    'Status',
                    'Størrelse',
                    'Dato'
                ]
            }
        },
        computed: {
            numberOfPages: function () {
                return Math.ceil(this.documentForUser.length / this.itemsPerPage)
            },
            filteredKeys(){
                return this.keys.filter(key => key !== 'filename')
            }
        },
        methods: {
            capitalize,
            determineStatus(status){
              switch (status) {
                case 0: return { text: "Venter på signering", color: "red lighten-2", icon: "mdi-alert-circle-outline"};
                    break;
                case 1:
                    return { text: "Delvis signert", color: "orange lighten-2", icon: "mdi-progress-check"}
                    break;
                case 2:
                    return { text: "Signert", color: "green lighten-2", icon: "mdi-check"}
                    break;
                default:
                    break;
              }
            },
            nextPage() {
                if (this.page + 1 <= this.numberOfPages()) this.page += 1
            },
            formerPage() {
                if(this.page -1 >= 1) this.page -= 1
            },
            updateItemsPerPage(number) {
                this.itemsPerPage = number
            },
            deleteDocument(id){
                console.log(id)
            }

        },
        apollo: {
            documentForUser: {
                query: DOCUMENT_FOR_USER
            }
        }
    }
</script>