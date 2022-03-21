<template>
    <div>
        <v-btn small rounded text class="success ml-2" @click="newAttendee()">
            <!-- <v-icon class="mr-2" size="20">mdi-account</v-icon> -->
            Add Attendee
        </v-btn>
    </div>
</template>
<script>
export default {
    data:() => ({
        addAttendeeDialog: false
    }),
    methods:{
        newAttendee(){
            this.$store.dispatch('addNewAttendee')
        }
    }
}
</script>