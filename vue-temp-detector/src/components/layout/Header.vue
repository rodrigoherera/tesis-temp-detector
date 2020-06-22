<template>
  <div id="app">
    <h1>Temp <span>Detector</span></h1>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Component from 'vue-class-component';

@Component({
  name: "Header",
})
export default class Header extends Vue {

}
</script>

<style lang="scss" scoped>
  h1 {
    color: #D7DADC;
    text-align: center;
    font-size: 3rem;
    padding-top: 10px;
    span {
      color: rgb(250, 101, 101);
    }
  }
</style>