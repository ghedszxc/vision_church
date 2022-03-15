<template>
    <div style="display: inline-block;">
        <v-btn icon @click="updateDisciple(selectedDisciple)">
          <v-icon color="warning">mdi-pencil</v-icon>
        </v-btn>
    </div>
</template>
<script>
export default {
    props: ['selectedDisciple'],
    data:() => ({

    }),
    methods:{
        updateDisciple(data){
            console.log(data)
        }
    }
}
</script>