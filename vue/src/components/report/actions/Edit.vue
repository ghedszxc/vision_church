<template>
    <div style="display: inline-block;">
        <v-btn icon @click="editDiscipleDialog = true">
          <v-icon color="warning">mdi-pencil</v-icon>
        </v-btn>
        
        <v-dialog v-model="editDiscipleDialog" persistent max-width="1000">
            <v-card>
                <v-card-title>
                    <span v-if="!formDisabled">
                        {{selectedDisciple.last_name}}, {{selectedDisciple.first_name}}
                    </span>
                    <span v-else>
                        <v-progress-circular indeterminate color="primary" size="20" class="mr-2"></v-progress-circular>
                        Processing your request ...
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn text color="error" @click="hideEditDiscipleDialog()" :disabled="formDisabled">
                        close
                    </v-btn>
                </v-card-title>
                <v-card-text class="mt-4">
                    <v-form ref="form">
                        <v-layout wrap>
                            <v-flex xs12 class="mb-7">
                                <span class="overline">Basic Information</span>
                                <v-divider style="margin: -1.7% 0% 0% 17%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 md3>
                                <v-text-field
                                    v-model="form.last_name"
                                    placeholder="Surname"
                                    label="Surname"
                                    outlined
                                    @input="setTypeCapitalize('last_name', form.last_name)"

                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.required,
                                        field_rules.text_and_spaces_only
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md4 class="px-2">
                                <v-text-field
                                    v-model="form.first_name"
                                    placeholder="Given Name"
                                    label="Given Name"
                                    outlined
                                    @input="setTypeCapitalize('first_name', form.first_name)"

                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.required,
                                        field_rules.text_and_spaces_only
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md3 class="pr-2">
                                <v-text-field
                                    v-model="form.middle_name"
                                    placeholder="Middle Name"
                                    label="Middle Name"
                                    outlined
                                    @input="setTypeCapitalize('middle_name', form.middle_name)"
                                    
                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.text_and_spaces_only
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md2>
                                <v-text-field
                                    v-model="form.suffix"
                                    placeholder="Suffix"
                                    label="Suffix"
                                    outlined
                                    @input="setTypeCapitalize('suffix', form.suffix)"
                                    
                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.text_and_spaces_only
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            
                            <v-flex xs12 md3>
                                <v-menu
                                    v-model="menu"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="auto">
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="form.birthday"
                                            placeholder="Birthday"
                                            label="Birthday"
                                            outlined
                                            
                                            :disabled="formDisabled"
                                            :rules="[field_rules.required]"
                                            v-bind="attrs"
                                            v-on="on"
                                        ></v-text-field>
                                    </template>
                                    <v-date-picker v-model="form.birthday" @input="menu = false"></v-date-picker>
                                </v-menu>
                            </v-flex>
                            <v-flex xs12 md9 class="pl-2">
                                <v-text-field
                                    v-model="form.address"
                                    placeholder="Address"
                                    label="Address"
                                    outlined
                                    @input="setTypeCapitalize('address', form.address)"
                                    
                                    :disabled="formDisabled"
                                    :rules="[field_rules.required]"
                                ></v-text-field>
                            </v-flex>
                            
                            <v-flex xs12 class="mb-7">
                                <span class="overline">Church Status</span>
                                <v-divider style="margin: -1.7% 0% 0% 14%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 md3>
                                <v-select
                                    v-model="form.network"
                                    placeholder="Network"
                                    label="Network"
                                    outlined

                                    :items="networkList"
                                    item-text="text"
                                    item-value="id"
                                    
                                    :disabled="formDisabled"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md3 class="px-2">
                                <v-select
                                    v-model="form.status"
                                    placeholder="Status"
                                    label="Status"
                                    outlined

                                    :items="statusList"
                                    item-text="text"
                                    item-value="id"
                                    
                                    :disabled="formDisabled"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md3 class="pr-2" v-if="form.status">
                                <v-autocomplete
                                    v-model="form.cell_leader_id"
                                    placeholder="Cell Leader"
                                    label="Cell Leader"
                                    outlined

                                    :items="discipleList"
                                    item-text="full_name"
                                    item-value="id"
                                    
                                    :disabled="formDisabled"
                                    :rules="[field_rules.required]"
                                ></v-autocomplete>
                            </v-flex>
                            <v-flex xs12 md3 v-if="form.status">
                                <v-autocomplete
                                    v-model="form.primary_leader_id"
                                    placeholder="Primary Leader"
                                    label="Primary Leader"
                                    outlined

                                    :items="discipleList"
                                    item-text="full_name"
                                    item-value="id"
                                    
                                    :disabled="formDisabled"
                                    :rules="[field_rules.required]"
                                ></v-autocomplete>
                            </v-flex>
                            <v-flex xs12 md6 v-if="!form.status">
                                <v-autocomplete
                                    v-model="form.inviter_id"
                                    placeholder="Inviter"
                                    label="Inviter"
                                    outlined

                                    :items="discipleList"
                                    item-text="full_name"
                                    item-value="id"
                                    
                                    :disabled="formDisabled"
                                    :rules="[field_rules.required]"
                                ></v-autocomplete>
                            </v-flex>
                        </v-layout>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn class="success px-5 mr-2" @click="updateDisciple()" :disabled="formDisabled">
                        Update
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
export default {
    props: ['selectedDisciple'],
    data:() => ({
        editDiscipleDialog: false,
        menu: false,

        form: {
            last_name: '', first_name: '', middle_name: '', suffix: '',
            status: 0, network: 0,

            address: '', birthday: '', age: 0,

            cell_leader_id: 0, primary_leader_id: 0, inviter_id: 0
        }

    }),
    watch:{
        editDiscipleDialog(to){
            if (to) {
                this.form = {
                    last_name: this.selectedDisciple.last_name,
                    first_name: this.selectedDisciple.first_name,
                    middle_name: this.selectedDisciple.middle_name,
                    suffix: this.selectedDisciple.suffix,

                    status: this.selectedDisciple.status,
                    network: this.selectedDisciple.network,

                    address: this.selectedDisciple.address,
                    birthday: this.selectedDisciple.birthday,
                    age: this.selectedDisciple.age,

                    inviter_id: this.selectedDisciple.inviter_id,
                    cell_leader_id: this.selectedDisciple.cell_leader_id,
                    primary_leader_id: this.selectedDisciple.primary_leader_id,
                }
            }
        }
    },
    methods:{
        setTypeCapitalize(object_name, data){
            if (object_name && data){
                this.form[object_name] = data.toLowerCase().replace(/\b[a-z](?=[a-z]{0})/g, function(val) { return val.toUpperCase() })
            }
        },
        hideEditDiscipleDialog(){
            this.$refs.form.reset()
            this.editDiscipleDialog = false
        },
        updateDisciple(){
            if (this.$refs.form.validate()) {
                this.formDisabled = true
                this.$http.put(`api/disciple/${this.selectedDisciple.id}`, this.form).then(response => {
                    this.$store.dispatch("updateDisciple", response.body)
                    this.editDiscipleDialog = false
                    this.formDisabled = false

                    // UPDATE FROM TABLE
                    let itemIndex = this.discipleList.indexOf(response.body)
                    let editedItem = { ...this.discipleList[itemIndex], ...response.body }
                    this.discipleList.splice(itemIndex, 1, editedItem)
                })
            }
        }
    }
}
</script>