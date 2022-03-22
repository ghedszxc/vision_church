<template>
    <div style="display: inline-block;">
        <v-btn small rounded class="primary mx-2" @click="newAttendee()"
            :text="count_attendees != discipleList.length"
            :disabled="count_attendees == discipleList.length">
            Add Attendee
        </v-btn>
    </div>
</template>
<script>
export default {
    props: ['count_attendees'],
    data:() => ({
        addAttendeeDialog: false
    }),
    methods:{
        newAttendee(){
            this.$store.dispatch('addNewAttendee', '')
        }
    }
}
</script>