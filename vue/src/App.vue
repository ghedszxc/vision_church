<template>
  <v-app style="background: #F0F2F5;">
    <!-- style="background-image: linear-gradient(-20deg, #00cdac 0%, #8ddad5 100%);" -->
    <router-view></router-view>
  </v-app>
</template>
<script>
export default {
  data:() => ({
    //
  })
}
</script>
<style lang="scss">
::-webkit-scrollbar {
  height:0;
  width:0;
  border-radius: 4px;
  background: transparent;
  transition: all 0.3s ease;
}

::-webkit-scrollbar:hover {
  background: transparent;
}

::-webkit-scrollbar-thumb {
  background:transparent;
  border-radius: 4px;
}
</style>
