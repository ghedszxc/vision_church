export default {
    data:() => ({
        windowSize: { height: 0, width: 0 },
        formDisabled: false,
        
        statusList: [
            { id: 0, text: '1T', color: 'error' },
            { id: 1, text: '2T', color: 'secondary' },
            { id: 2, text: '3T', color: 'success' },
            { id: 3, text: '4T', color: 'warning' },
            { id: 4, text: '5T', color: 'accent' },
            { id: 5, text: 'RD', color: 'primary' },
        ],

        networkList: [
            { id: 0, text: 'YM', color: 'primary' },
            { id: 1, text: 'M', color: 'primary' },
            { id: 2, text: 'YW', color: 'pink' },
            { id: 3, text: 'W', color: 'pink' }
        ],

        positionList: [
            'VIP', 'Disciple', 'Leader', 'Primary'
        ],
        
        field_rules: {
            required: value => !!value || 'This field is required.',

            text_and_spaces_only: value => {
                const pattern = /^[Ñña-zA-Z ]*$/
                return pattern.test(value) || 'Invalid characters.'
            },
            email: value => {
              const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
              return pattern.test(value) || 'Invalid e-mail address.'
            },
            text_number_spaces_only: value => {
                const pattern = /^[a-zA-Z0-9 ]*$/
                return pattern.test(value) || 'Invalid characters.'
            },
            number_only: value => {
                const pattern = /^[0-9]*$/
                return pattern.test(value) || 'Numbers only.'
            }
        }
    }),
    computed: {
        authUser(){
            return this.$store.state.authUser
        },
        snackBar(){
            return this.$store.state.snackBar
        },
        tableLoad(){
            return this.$store.state.tableLoad
        },

        eventList(){
            return this.$store.state.eventList;
        },
        discipleList(){
            return this.$store.state.discipleList;
        },
        archivedDiscipleList(){
            return this.$store.state.archivedDiscipleList;
        }
    },
    methods:{
        onGlobalResize(){
            this.windowSize = { height: window.innerHeight, width: window.innerWidth }
        },
        getTimestamp() {
            let date = new Date();
            let mm = (date.getMonth() + 1).toString().padStart(2, 0);
            let year = date.getFullYear();
            let dd = date.getDate().toString().padStart(2, 0);

            return `${year}-${mm}-${dd}`;
        },
    }
}