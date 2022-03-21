export default {
    data:() => ({
        statusList: [
            { id: 0, text: '1T', color: 'error' },
            { id: 1, text: '2T', color: 'secondary' },
            { id: 2, text: '3T', color: 'success' },
            { id: 3, text: '4T', color: 'warning' },
            { id: 4, text: '5T', color: 'accent' },
            { id: 5, text: 'RD', color: 'primary' },
        ],

        networkList: [
            { id: 0, text: 'YM' },
            { id: 1, text: 'M' },
            { id: 2, text: 'YW' },
            { id: 3, text: 'W' }
        ],

        positionList: [
            'VIP', 'Disciple', 'Leader', 'Primary'
        ]
    }),
    computed: {
        snackBar(){
            return this.$store.state.snackBar
        }
    }
}