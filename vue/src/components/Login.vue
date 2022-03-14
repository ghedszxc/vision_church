<template>
    <div>
        <v-card class="centerDiv">
            <!-- <v-card-title>
                <v-spacer></v-spacer>
                LOGIN
                <v-spacer></v-spacer>
            </v-card-title> -->
            <v-card-text>
                <v-form ref="form_validation">
                    <v-layout wrap>
                        <v-flex xs12>
                            <v-text-field
                                v-model="username"
                                placeholder="Username"
                                prepend-inner-icon="mdi-account"
                                outlined
                            ></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <v-text-field
                                v-model="password"
                                placeholder="Password"
                                prepend-inner-icon="mdi-lock"
                                :append-icon="show_passowrd ? 'mdi-eye' : 'mdi-eye-off'"
                                :type="show_passowrd ? 'text' : 'password'"
                                @click:append="show_passowrd = !show_passowrd"
                                outlined
                            ></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <v-btn block class="primary py-6" @click="$router.push('/dashboard')">
                                Login
                            </v-btn>
                        </v-flex>
                    </v-layout>
                </v-form>
            </v-card-text>
        </v-card>
    </div>
</template>
<script>
export default {
    data:() => ({
        username: '',
        password: '',
        show_passowrd: true
    })
}
</script>
<style scoped>
.centerDiv {
    margin: 15% auto auto auto;
    width: 25%;
}
</style>