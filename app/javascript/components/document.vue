<template>
    <div>
        <span class="">{{document.id}} | {{document.status}} | {{document.user_id}} |{{document.file_path}}</span>
    </div>
</template>

<script>
    export default {
        name: 'DocumentItem',
        props: ['document'],
        data() {
            return{

            }
        }
    }
</script>