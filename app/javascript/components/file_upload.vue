<template>
    <v-container>

        <v-card flat outlined elevation="3" class="px-8">
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
            <v-card-text class="mt-n12 text-center">
                <v-btn
                    color="success"
                    x-large
                    class="px-12"
                >
                    <v-icon left>mdi-plus-circle-outline</v-icon>
                    <span>Legg til fil</span>
                </v-btn>
            </v-card-text>

            <v-divider class="mx-auto"></v-divider>

            <v-card-text>
                <v-form v-model="valid">
                    <v-label>Legg til mottaker</v-label>
                    <div v-for="(input, k) in inputs" :key="k">
                        <v-text-field
                                outlined
                                label="Mottaker"
                                :rules="emailRules"
                                required
                        >
                            <template slot="append">
                                <v-icon @click="remove(k)" color="error" v-show="inputs.length > 1 && k > 0">mdi-minus-circle</v-icon>
                            </template>
                        </v-text-field>
                    </div>
                    <v-icon @click="add" color="success">mdi-plus-circle</v-icon>

                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>
    import {logout} from "../network/vue-rails";

    export default {
        data() {
            return {
                dragAndDropCapable: false,
                files: [],
                inputs: [
                    {
                        name: 'Mottaker'
                    }
                ],
                valid: false,
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
                ]

            }
        },
        methods: {
            add(){
                this.inputs.push({ name: 'Mottaker' })
            },
            remove(index){
                this.inputs.splice(index, 1)
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
            checkDrag() {
                this.dragAndDropCapable = this.determineDragAndDropCapable()
                console.log(this.dragAndDropCapable)
            }
        }
    }
</script>

<style scoped>
    .border {
        border: dashed 2px rgba(0,0,0,0.4);
    }
</style>