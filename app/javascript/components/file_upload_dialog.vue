<template>
    <v-row justify="center">
        <v-dialog v-model="show" max-width="800px">
            <v-card outlined tile class="px-8">
                <AlertWindow v-if="alertObject.show" :alert-content="alertObject"/>

                <!-- Button for adding files without drag and drop -->
                <v-card-title class="ml-0">
                    <p class="display-1 font-weight-light d-block">Legg til signering</p>

                    <v-btn
                        color="primary"
                        x-large
                        block
                        class="px-12"
                        @click="openInput"
                        dark
                >
                    <v-icon left>mdi-plus-circle-outline</v-icon>
                    <span>Legg til fil</span>
                </v-btn></v-card-title>

                <input type="file" ref="file_input" style="display:none;" @change="onFileChange">

                <!-- Files for upload -->
                <v-card
                        v-for="(file, i) in files"
                        :key="i"
                        color="blue-grey lighten-5"
                        flat
                        class="ma-4"
                        hover
                >
                    <v-list-item>
                        <v-icon x-large color="teal" class="ma-2">mdi-file</v-icon>
                        {{ file.name }} {{ file.size/1000 }} kb
                        <v-row
                                align="center"
                                justify="end"
                        >
                            <v-icon @click="close(i)" class="ma-2">mdi-trash-can</v-icon>
                        </v-row>
                    </v-list-item>
                </v-card>

                <v-divider class="ma-4"></v-divider>
                <v-form v-model="valid" ref="form">
                    <v-card-text>

                        <div v-for="(recipient, k) in emailRecipient" :key="k">
                            <v-text-field
                                    outlined
                                    chips
                                    v-model="recipient.email"
                                    label="Mottaker"
                                    :rules="emailRules"
                                    required
                                    prepend-inner-icon="mdi-email"
                            >
                                <template slot="append">
                                    <v-icon @click="removeEmailField(k)" color="pink lighten-2" v-show="emailRecipient.length > 1 && k > 0">mdi-minus-circle</v-icon>
                                </template>
                            </v-text-field>
                        </div>
                        <v-btn
                                block
                                depressed
                                dark
                                x-large
                                color="primary"
                                @click="addEmailField()"
                        >
                            <v-icon left>mdi-plus-circle-outline</v-icon>
                            Legg til mottaker
                        </v-btn>


                    </v-card-text>
                    <v-card-actions>
                        <v-btn @click="uploadFileAxios" text color="primary">Send til signering</v-btn>
                        <v-btn color="blue darken-1" text @click="show = false">Avbryt</v-btn>
                    </v-card-actions>
                </v-form>
            </v-card>
        </v-dialog>
    </v-row>
</template>

<script>
    import axios from 'axios'
    import AlertWindow from './alert_window'

    export default {
        components: {
            AlertWindow
        },
        props: ['dialog'],
        data() {
            return {
                files: [],
                emailRecipient: [
                    {
                        email: ''
                    }
                ],
                valid: false,
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
                ],
                alertObject: {
                    message: '',
                    show: false,
                    type: ''
                }
            }
        },
        methods: {
            // Recipient methods
            makeEmailArray() {
                // The emails are objects, and rails cant parse them.
                // Therefore convert them to a string array
                const array = [];
                this.emailRecipient.forEach((item) => {
                    let jsonEmail = JSON.parse(JSON.stringify(item));
                    array.push(jsonEmail.email)
                });
                return array
            },
            addEmailField(){
                this.emailRecipient.push({email: ''})
            },
            removeEmailField(index){
                this.emailRecipient.splice(index, 1)
            },
            // File upload methods
            openInput(){
                this.$refs.file_input.click()
            },
            onFileChange({ target }) {
                let file = target.files[0]
                this.files.push(file)
            },
            close(index) {
                this.files.splice(index, 1)
                console.log(index)
            },
            uploadFileAxios() {
                if(this.$refs.form.validate()){
                    const file = this.files[0]
                    if(file) {
                        const email = this.makeEmailArray()

                        const paramsDocument = {
                            'document[file]': file,
                            'document[status]': 0,
                            'document[email]': email
                        }

                        let formData = new FormData()

                        Object.entries(paramsDocument).forEach(
                            ([key, value]) => formData.append(key, value)
                        )

                        axios.post('/documents', formData).then(response => {
                            this.successAlert = true
                            this.errorAlert = false
                            this.files = []
                            this.emailRecipient = [{email: ''}]
                            this.makeAlert("Dokument lastet opp til signering", "success")
                            this.$refs.form.resetValidation()
                            this.show = false
                        }).catch(error => {
                            this.makeAlert("Dokument kunne ikke lastest opp." + error, "error")

                        })
                    } else {
                        this.makeAlert("Du må velge et dokument til opplasting", "error")
                    }

                }
            },
            makeAlert(message, type){
                this.alertObject = {
                    show: true,
                    type: type,
                    message: message
                }
                setTimeout(() => {
                    this.alertObject.show = false
                }, 3000)

            }
        },
        computed: {
            show: {
                get() {
                    return this.dialog
                },
                set(value) {
                    this.$emit('update:dialog', value)
                }
            }
        }

    }
</script>

<style scoped>
    .border {
        border: dashed 2px rgba(0,0,0,0.4);
    }
</style>