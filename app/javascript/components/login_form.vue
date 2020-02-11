<template>
    <v-app>
        <v-form class="color">
            <v-container>
                <v-row justify="center">
                    <v-col
                            cols="12"
                            md="4"
                    >
                        <v-text-field
                                v-model="email"
                                :rules="emailRules"
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
                                v-model="password"
                                :rules="password"
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
    </v-app>
</template>

<style scoped>

</style>
