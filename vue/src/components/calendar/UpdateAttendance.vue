<template>
    <div>
        <v-layout wrap>
            <v-flex xs12 class="mb-7">
                <span class="overline">Attendees</span>
                <v-divider style="margin: -1.7% 0% 0% 17%;"></v-divider>
            </v-flex>
            <v-flex xs12>
                {{selectedEvent}}
            </v-flex>
        </v-layout>
    </div>
</template>
<script>
export default {
    props: ['selectedEvent'],
    data:() => ({

    })
}
</script>