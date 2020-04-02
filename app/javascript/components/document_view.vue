<template>
    <span>
        <v-row>
            <!-- "Buttons" for changing view from document-list to recipients -->
            <v-col
                    lg="10"
                    sm="12"
                    offset-lg="1"
                    class="pl-0"
            >
                <a @click="active = !active" :class="active ? 'secondary--text' : 'black--text'" class="font-weight-medium">Mine Signeringer</a>
                <span class="align-self-md-center secondary--text mx-4">/</span>
                <a @click="active = !active" :class="active ? 'black--text' : 'secondary--text'" class="font-weight-medium ">Signeringer til meg</a>
            </v-col>
        </v-row>
        <!-- Components show dependant on what is active -->
        <DocumentList v-show="active"/>
    </span>
</template>

<style>
</style>

<script>
    import DocumentList from './document-list'

    export default {
        data(){
            return {
                active: true
            }
        },
        components: {
            DocumentList,
        },
        methods: {

        }
    }
</script>