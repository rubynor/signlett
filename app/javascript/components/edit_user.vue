<template>
        <span>
            <v-form
                    ref="form"
                    v-model="valid"
                    lazy-validation
            >
                <v-row>
                    <v-col
                            cols="10"
                            offset-sm="1"
                            class="mt-12 pl-0"
                    >
                        <v-row
                                class="display-1"
                        >
                            <v-col
                                lg="6"
                            >
                                <span><span :class="edit ? 'font-weight-thin': 'font-weight-light'">Min profil</span> <v-scroll-x-transition><span v-if="edit" class="font-weight-light"><v-icon>mdi-chevron-right</v-icon> Rediger profil</span></v-scroll-x-transition></span>
                            </v-col>
                            <v-col
                                    align-self="center"
                                    lg="6"
                            >
                                <v-btn v-if="!edit" large class=" float-right white--text secondary" @click="edit = !edit"><v-icon left>mdi-pen</v-icon> Rediger </v-btn>
                                <ApolloMutation
                                    :mutation="require('../graphql/UpdateUser.gql')"
                                    :variables="{id: this.userLoggedIn.id, email: this.userLoggedIn.email, firstName: this.userLoggedIn.firstName, lastName: this.userLoggedIn.lastName, password: this.passwordTwo}"
                                    @done="edit = !edit"
                                >
                                    <template v-slot="{ mutate, error}">
                                        <span v-if="error">{{error}}</span>
                                        <v-btn v-if="edit" large class="float-right white--text primary" @click="validate() ? mutate : '' "><v-icon left>mdi-plus</v-icon> Aksepter </v-btn>
                                        <v-btn v-if="edit" large class="mr-4 float-right white--text error" @click="edit = !edit"><v-icon left>mdi-close</v-icon> Avbryt </v-btn>
                                    </template>
                                </ApolloMutation>
                            </v-col>
                        </v-row>
                    </v-col>
                </v-row>
                <v-row>
                    <v-col
                            cols="12"
                            sm="10"
                            offset-sm="1"
                            class="elevation-3 bc-color mt-5 pa-4 pb-12"
                    >
                        <p class="display-2">{{userLoggedIn.firstName}}</p>
                            <v-row>
                                <v-col>
                                    <v-text-field
                                            outlined
                                            contenteditable="false"
                                            flat
                                            v-model="userLoggedIn.firstName"
                                            :rules="firstNameRules"
                                            hide-details="auto"
                                            label="Fornavn"
                                            required
                                            :disabled="!edit"
                                            class="mb-4"
                                    ></v-text-field>
                                </v-col>
                                <v-col>
                                    <v-text-field
                                            outlined
                                            :disabled="!edit"
                                            flat
                                            v-model="userLoggedIn.lastName"
                                            :rules="lastNameRules"
                                            hide-details="auto"
                                            label="Etternavn"
                                            required
                                            class="mb-4"
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-text-field
                                    outlined
                                    :disabled="!edit"
                                    v-model="userLoggedIn.email"
                                    :rules="emailRules"
                                    label="E-post"
                                    hide-details="auto"
                                    required
                                    class="mb-4"
                            ></v-text-field>
                            <v-text-field
                                    outlined
                                    :disabled="!edit"
                                    :type="showPasswordOne ? 'text' : 'password'"
                                    :append-icon="showPasswordOne ? 'mdi-eye' : 'mdi-eye-off'"
                                    v-model="passwordOne"
                                    :rules="passwordRules"
                                    hide-details="auto"
                                    label="Nytt passord"
                                    @click:append="showPasswordOne = !showPasswordOne"
                                    class="mb-4"
                            ></v-text-field>
                            <v-text-field
                                    outlined
                                    :disabled="!edit"
                                    :type="showPasswordTwo ? 'text' : 'password'"
                                    :append-icon="showPasswordTwo ? 'mdi-eye' : 'mdi-eye-off'"
                                    v-model="passwordTwo"
                                    :rules="passwordRules"
                                    hide-details="auto"
                                    label="Gjenta passord"
                                    :requried="false"
                                    @click:append="showPasswordTwo = !showPasswordTwo"
                                    class="mb-4"
                            ></v-text-field>
                    </v-col>
                </v-row>
            </v-form>
        </span>
</template>

<style>
    .tile {
        border-radius: 0px;
    }
    .bc-color{
        background-color: white;
    }
    .no-border {
        border: none;
    }
</style>

<script>
    import userLocalQuery from '../graphql/UserLocal.gql'
    export default {
        data() {
            return {
                userLoggedIn: [],
                valid: true,
                firstNameRules: [
                    v => !!v || 'Name is required',
                ],
                lastNameRules: [
                    v => !!v || 'Name is required',
                ],
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
                ],
                passwordOne: '',
                passwordTwo: '',
                showPasswordOne: false,
                showPasswordTwo: false,
                passwordRules: [
                    v => !!v || 'Password is required',
                    v => v.length >= 6 || 'Passordet må minst inneholde 8 karakterer'
                ],
                edit: false
            }
        },
        methods: {
            validate () {
                this.$refs.form.validate()
            }
        },
        apollo: {
            userLoggedIn: {
                query: userLocalQuery
            }
        }
    }
</script>