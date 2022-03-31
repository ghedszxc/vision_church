<template>
    <div>
        <v-app-bar app class="primary">
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
            <!-- <v-menu offset-y open-on-hover bottom>
                <template v-slot:activator="{ on, attrs }">
                    <v-btn rounded text class="primary" v-bind="attrs" v-on="on">
                        <v-icon class="mr-2" size="20">mdi-account</v-icon>
                        Auth Name
                        <v-icon class="ml-2">mdi-menu-down</v-icon>
                    </v-btn>
                </template>
                <v-list>
                    <v-list-item link>
                        <v-list-item-title>Log out</v-list-item-title>
                    </v-list-item>
                </v-list>
            </v-menu> -->
        </v-app-bar>
    </div>
</template>
<script>
export default {
    data:() => ({
        
    })
}
</script>