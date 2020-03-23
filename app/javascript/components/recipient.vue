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
        </v-row>
    </div>
     <v-row
         class="mx-auto"
     >
            <v-col>
                <v-divider class="mx-5"></v-divider>
                <p class="mt-4">Hendelser</p>
            </v-col>
        </v-row>
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
            isSigned(signed){

            }
        },

    }
</script>