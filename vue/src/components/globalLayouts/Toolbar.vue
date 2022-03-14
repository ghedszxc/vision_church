<template>
    <div>
        <v-app-bar app >
            <v-toolbar-title class="text-capitalize">
                {{$route.path.split("/")[1]}}
            </v-toolbar-title>


            <v-spacer></v-spacer>
            <v-btn icon :class="$route.path == '/dashboard' ? 'primary' : ''" @click="$router.push('/dashboard')">
                <v-icon :color="$route.path == '/dashboard' ? 'white' : ''">mdi-view-dashboard</v-icon>
            </v-btn>

            <v-btn icon :class="$route.path == '/calendar' ? 'primary' : ''" @click="$router.push('/calendar')">
                <v-icon :color="$route.path == '/calendar' ? 'white' : ''">mdi-calendar</v-icon>
            </v-btn>

            <v-btn icon :class="$route.path == '/report' ? 'primary' : ''" @click="$router.push('/report')">
                <v-icon :color="$route.path == '/report' ? 'white' : ''">mdi-view-list</v-icon>
            </v-btn>

            <v-spacer></v-spacer>
            <v-btn rounded text class="primary">
                <v-icon class="mr-2" size="20">mdi-account</v-icon>
                Auth Name
            </v-btn>
        </v-app-bar>
    </div>
</template>
<script>
export default {
    data:() => ({
        
    })
}
</script>