<template>
  <div>
    <Auth />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Auth from '../components/Auth.vue';

@Component({
  components: {
    Auth,
  }
})
export default class Home extends Vue{

}

</script>

<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    background: #030303;
    font-family: 'Roboto Condensed', sans-serif;
    line-height: 1.4;
  }
</style>