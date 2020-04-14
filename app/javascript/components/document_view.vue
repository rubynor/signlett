<template>

    <span>
        <v-row>
            <!-- "Buttons" for changing view from document-list to recipients -->
            <v-col
                    lg="10"
                    sm="12"
                    offset-lg="1"
                    offset-sm="1"
                    class="pl-0"
            >
                <a @click="active = !active" :class="active ? 'secondary--text' : ''" class="font-weight-medium">Mine Signeringer</a>
                <span class="align-self-md-center secondary--text mx-4">/</span>
                <a @click="active = !active" :class="active ? '' : 'secondary--text'" class="font-weight-medium ">Signeringer til meg</a>
            </v-col>
        </v-row>
        <!-- Components show dependant on what is active -->
        <SignatureToUser v-show="!active"/>
        <DocumentList v-show="active"/>
    </span>
</template>

<style>
</style>

<script>
    import DocumentList from './document-list'
    import SignatureToUser from './signatures_to_user'

    export default {
        data(){
            return {
                active: true
            }
        },
        components: {
            DocumentList,
            SignatureToUser
        },
        methods: {

        }
    }
</script>