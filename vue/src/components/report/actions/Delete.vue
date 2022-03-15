<template>
    <div style="display: inline-block;">
        <v-btn icon @click="deleteItem(item)">
          <v-icon color="error">mdi-delete</v-icon>
        </v-btn>
    </div>
</template>
<script>
export default {
    props: ['selectedDisciple'],
    data:() => ({

    }),
    methods:{
        deleteItem(data){
            console.log(data)
        }
    }
}
</script>