<template>
    <div>
        DASHBOARD
    </div>
</template>
<script>
export default {
    data:() => ({
        
    }),
    mounted(){
        this.$http.get('api/disciple').then(response => {
            console.log("response: ", response)
        })
    }
}
</script>