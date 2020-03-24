<template>
 <div
    v-if="recipient"
    class="mx-auto grey lighten-4"
 >
    <div
            v-for="recObj in recipient"
    >
            <v-row class="mx-auto">
                <v-col
                    class="font-weight-light"
                >
                    Mottaker: {{recObj.email}}
                </v-col>
                <v-col>
                    <v-chip
                            outlined
                            color="red lighten-2"
                            dark
                            v-if="!recObj.signed"
                    >
                        <v-icon left>mdi-alert-circle-outline</v-icon>
                        Ikke signert
                    </v-chip>
                    <v-chip
                            outlined
                            color="green lighten-2"
                            v-if="recObj.signed"
                            dark
                    >
                        <v-icon left>mdi-check</v-icon>
                        Signert
                    </v-chip>
                </v-col>
                <v-col>
                    <p class="font-weight-thin">Sist oppdatert</p>
                    <p class="font-weight-light" :class="compareDate(recObj.updatedAt)">{{recObj.updatedAt}}</p>
                </v-col>
                <v-col>
                    <v-tooltip
                            bottom
                    >
                        <template v-slot:activator="{ on }">
                            <v-btn
                                    v-on="on"
                                    icon
                                    color="green lighten-2"
                            >
                                <v-icon>mdi-reminder</v-icon>
                            </v-btn>
                        </template>
                        <span>Send varsel</span>
                    </v-tooltip>
                </v-col>
        </v-row>
    </div>

         <ApolloQuery
            :query="require('../graphql/EventForDocument.gql')"
            :variables="{documentId: document.id}"
         >
             <template v-slot="{ result: {error, data} }">
                 <v-row
                         class="mx-auto"
                         v-if="data && data.eventForDocument"
                         v-bind="events = data.eventForDocument"
                 >
                         <v-col>
                             <v-divider class="mx-5"></v-divider>
                             <p class="mt-4 font-weight-medium">Hendelser</p>
                             <p class="font-weight-thin" v-for="event in events">{{event.createdAt}} - {{event.message}}</p>
                         </v-col>

                 </v-row>
                 <v-row
                         class="mx-auto"
                         v-if="error"
                 >
                     <v-col>
                         <v-divider class="mx-5"></v-divider>
                         <p class="mt-4 font-weight-medium">Hendelser</p>
                         <p class="font-weight-thin">{{error}}</p>
                     </v-col>
                 </v-row>
             </template>
         </ApolloQuery>
 </div>
</template>

<script>
    export default {
        name: 'Recipient',
        props: ['recipient', 'document'],
        data(){
            return {
                e1: 1
            }
        },
        methods: {
            compareDate(recDate){
                let dateOne = new Date(recDate)
                const oneDay = 60 * 60 * 24 *1000
                const daysPassed = (new Date - dateOne)/oneDay
                if(daysPassed > 1) {
                    return "red--text text-lighten-2"
                }

            }
        },

    }
</script>