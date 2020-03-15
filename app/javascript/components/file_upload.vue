<template>
    <v-container>
        <v-alert
            :value="successAlert"
            text
            type="success"
            border="left"
        >
            {{ this.alertMessage }}
        </v-alert>
        <v-alert
                :value="errorAlert"
                text
                type="error"
                border="left"
        >
            {{ this.alertMessage }}
        </v-alert>
        <v-card outlined tile class="px-8">
            <v-card
                    outlined
                    class="mt-4"
                    color="blue-grey lighten-5"
            >
                <div class="border upload-height ma-1 pa-2">
                    <form ref="fileform">
                        <p class="text-center">Dra filene inn for opplasting</p>
                        <h1 class="text-center display-4"><v-icon x-large>mdi-upload</v-icon></h1>
                    </form>
                </div>
            </v-card>

            <!-- Button for adding files without drag and drop -->
            <v-card-text class="mt-n12 text-center">
                <v-btn
                    color="teal"
                    x-large
                    class="px-12"
                    @click="openInput"
                    dark
                >
                    <v-icon left>mdi-plus-circle-outline</v-icon>
                    <span>Legg til fil</span>
                </v-btn>
                <input type="file" ref="file_input" style="display:none;" @change="onFileChange">
            </v-card-text>

            <!-- Files for upload -->
            <v-card
                v-for="(file, i) in files"
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

            <v-card-text>
                <v-form v-model="valid">
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
                                <v-icon @click="remove(k)" color="pink lighten-2" v-show="emailRecipient.length > 1 && k > 0">mdi-minus-circle</v-icon>
                            </template>
                        </v-text-field>
                    </div>
                    <v-btn
                            block
                            depressed
                            dark
                            x-large
                            color="teal"
                            @click="add"
                    >
                        <v-icon left>mdi-plus-circle-outline</v-icon>
                        Legg til mottaker
                    </v-btn>

                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-btn @click="uploadFileAxios" text color="primary">Send til signering</v-btn>
            </v-card-actions>
        </v-card>
    </v-container>
</template>

<script>
    import axios from 'axios'

    export default {
        data() {
            return {
                dragAndDropCapable: false,
                files: [],
                recipientEmail: [],
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
                alertMessage: '',
                successAlert: false,
                errorAlert: false,

            }
        },
        methods: {
            checkEmail() {
                const email = JSON.stringify(this.emailRecipient, null, 0)
                console.log(email.toString())
            },
            checkFileType(fileType) {

            },
            add(){
                this.emailRecipient.push({ email: '' })
            },
            remove(index){
                this.emailRecipient.splice(index, 1)
            },
            openInput(){
                this.$refs.file_input.click()
            },
            determineDragAndDropCapable() {
                let div = document.createElement('div')
                return (('draggable' in div)
                    || ('ondragstart' in div && 'ondrop' in div) )
                    && 'FormData' in window
                    && 'FileReader' in window;
            },
            mounted() {
                this.dragAndDropCapable = this.determineDragAndDropCapable();
                if(this.dragAndDropCapable)
                    ['drag', 'dragstart', 'dragend', 'dragover', 'dragenter', 'dragleave', 'drop'].forEach( function (evt) {
                        this.$refs.fileform.addEventListener(evt, function(e){
                            e.preventDefault();
                            e.stopPropagation();
                        }.bind(this), false)
                    }.bind(this));

                this.$refs.fileform.addEventListener('drop', function(e){
                    for( let i = 0; i < e.dataTransfer.files.length; i++)
                        this.files.push(e.dataTransfer.files[i])
                }.bind(this))

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
                const file = this.files[0]
                const email = JSON.stringify(this.emailRecipient, null, 2)

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
                    this.recipientEmail = ""
                    this.alertMessage = "Dokument lastet opp til signering"
                }).catch(error => {
                    this.successAlert = false
                    this.errorAlert = true
                    this.alertMessage = "Dokument kunne ikke lastest opp." + error
                })
            }
        }
    }
</script>

<style scoped>
    .border {
        border: dashed 2px rgba(0,0,0,0.4);
    }
</style>