<template>
 <span
    v-if="recipient"
 >
     <v-container>
         <v-stepper vertical v-model="e6">
             <v-stepper-step :complete="e6 > 1" step="1">
                 Dokument lastet opp
             </v-stepper-step>
             <v-stepper-content step="1">
                 <v-icon color="success">mdi-check-circle-outline</v-icon>
                 {{document.user.firstName}} lastet opp et dokument for signering
             </v-stepper-content>
         </v-stepper>
         <v-stepper-step :complete="e6 > 2" step="2">
             {{recipient.email}}
         </v-stepper-step>
     </v-container>
 </span>
</template>

<script>
    export default {
        name: 'Recipient',
        props: ['recipient', 'document'],
        data(){
            return {
                e6: 1
            }
        },
        methods: {
            isSigned(signed){

            }
        }

    }
</script>