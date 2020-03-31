<template>
    <span>
        <DocumentList/>
        <FileUpload/>
    </span>
</template>

<script>
    import DocumentList from './document-list'
    import FileUpload from './file_upload_dialog'

    export default {
        data(){
            return {

            }
        },
        components: {
            DocumentList,
            FileUpload
        }
    }
</script>