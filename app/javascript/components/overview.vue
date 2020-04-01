<template>
    <v-row>
        <v-col
            lg="10"
            offset-lg="1"
        >
            <v-row>
                <!-- Document out for signing -->
                <v-col class="pl-0" lg="6" sm="12">
                    <v-card tile>
                        <v-card-title class="font-weight-light justify-center">Signerte mottakere</v-card-title>
                        <div class="text-center">
                            <v-progress-circular
                                    class="ma-4 display-1 text-center"
                                    :rotate="360"
                                    :size="250"
                                    :width="15"
                                    :value="signedRecipient().length/numberOfRecipients()*100"
                                    color="primary"
                            >
                                <v-row>
                                    <v-col
                                            cols="12"
                                    >
                                        <v-icon class="justify-center" large color="primary">mdi-lead-pencil</v-icon>

                                    </v-col>
                                    <v-col class="grey--text">
                                        {{ signedRecipient().length }} av {{numberOfRecipients()}}
                                    </v-col>
                                </v-row>
                            </v-progress-circular>
                        </div>
                        <v-card-text>
                        </v-card-text>
                    </v-card>
                </v-col>
                <!-- User as recipient -->
                <v-col class="pr-0" lg="6" sm="12">
                    <v-card tile>
                        <v-card-title class="font-weight-light justify-center">Signerte dokumenter</v-card-title>
                        <div class="text-center">
                            <v-progress-circular
                                    class="ma-4 display-1 text-center"
                                    :rotate="360"
                                    :size="250"
                                    :width="15"
                                    :value="signedDocument().length/documentForUser.length*100"
                                    color="primary"
                            >
                                <v-row>
                                    <v-col
                                            cols="12"
                                    >
                                        <v-icon class="justify-center" large color="primary">mdi-file-document-edit-outline</v-icon>
                                    </v-col>
                                    <v-col class="grey--text">
                                        {{ signedDocument().length }} av {{documentForUser.length}}

                                    </v-col>
                                </v-row>
                            </v-progress-circular>
                        </div>
                        <v-card-text>
                        </v-card-text>
                    </v-card>
                </v-col>
                <!-- Latest events -->
                <v-col sm="12" class="px-0">
                    <v-card>
                        <div class="d-flex flex-no-wrap justify-space-between">
                            <div>
                                <v-card-title class="font-weight-light">Antall dokumenter siste måned: {{documentForUser.length}}</v-card-title>
                                <v-card-title class="font-weight-light">Antall dokumenter siste måned: {{documentForUser.length}}</v-card-title>
                            </div>
                            <v-avatar
                                    class="ma-3"
                                    size="125"
                                    tile
                            >
                                <v-img src="https://cdn.vuetifyjs.com/images/cards/foster.jpg"></v-img>
                            </v-avatar>
                        </div>

                    </v-card>
                </v-col>

            </v-row>
        </v-col>
    </v-row>
</template>

<script>
    import { LOCAL_DOCUMENT } from "../constants/graphql";

    export default {
        data() {
            return {
                documentForUser: [],
                value: 0,
                numberOfRecipient: 0
            }
        },
        methods: {
            signedDocument() {
                let signed = []
                this.documentForUser.forEach(document => {
                    if(document.status === 2) signed.push(document)
                });
                return signed
            },
            unSignedRecipient() {
                let signed = []
                this.documentForUser.forEach(document => {
                    document.recipient.forEach(recipient => {
                        if(recipient.signed === false)signed.push(recipient)
                    })
                });
                return signed
            },
            signedRecipient() {
                let signed = []
                this.documentForUser.forEach(item => {
                    item.recipient.forEach(recipient => {
                        if(recipient.signed === true)signed.push(recipient)
                    })
                });
                return signed
            },
            numberOfRecipients() {
                let numberOfRecipient = 0
                this.documentForUser.forEach(document => {
                    document.recipient.forEach(recipient =>  {
                        recipient ? numberOfRecipient++ : ''
                    })
                })
                return numberOfRecipient
            }

        },
        apollo: {
            documentForUser: {
                query : LOCAL_DOCUMENT
            }
        }
    }
</script>