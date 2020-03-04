<template>
    <v-app>
        <v-form>
            <v-container>
                <p class="title font-weight-light text-center">Logg inn</p>

                <v-row justify="center">
                    <v-col
                            cols="12"
                            md="4"
                            xs="12"
                    >
                        <v-text-field
                                label="E-post"
                                solo
                                required
                        ></v-text-field>
                    </v-col>
                </v-row>
                <v-row justify="center">
                    <v-col
                            cols="12"
                            md="4"
                    >
                        <v-text-field
                                label="Passord"
                                solo
                                required
                        >
                        </v-text-field>
                    </v-col>
                </v-row>
                <v-row justify="center">
                    <v-col
                            cols="12"
                            md="2">
                        <v-btn class="font-weight-black" text color="primary">Logg inn</v-btn>
                    </v-col>
                    <v-col
                            cols="12"
                            md="2">
                        <v-btn text color="primary">Registrer deg</v-btn>
                    </v-col>
                </v-row>
            </v-container>
        </v-form>
        <div class="font-weight-thin display-2">
            <document-list></document-list>
        </div>
    </v-app>
</template>

<script>
    import DocumentList from './document-list'

    export default {
        name: 'login',
        components: {
            DocumentList
        }

    }
</script>

<style scoped>

</style>
