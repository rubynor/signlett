<template>
    <v-container>
        <v-card>
            <v-card-title>
                <h1 class="display-1 font-weight-light">Last opp nytt dokument til signering</h1>
            </v-card-title>
            <v-card-text>
                <v-file-input></v-file-input>
            </v-card-text>
            <v-card-actions>
                <v-btn outlined color="primary">Last opp</v-btn>
            </v-card-actions>
        </v-card>
    </v-container>
</template>

<script>
    export default {
        data() {
            return {

            }
        }
    }
</script>