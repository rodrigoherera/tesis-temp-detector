<template>
  <div class="temp">
    <div class="container" v-if="temperatures">
      <div v-bind:key="temperature.date" v-for="temperature in temperatures">
        <Temperature v-bind:temperature="temperature"/>
      </div>
    </div>
    <div v-else>
      <h3>No hay info</h3>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Component from 'vue-class-component';
import Temperature from './Temperature.vue';
import temperatures from '@/store/modules/Temperature';

@Component({
  name: "TemperatureList",
  components: {
    Temperature,
  }
})
export default class TemperatureList extends Vue{
 
  get temperatures() {
    return temperatures.temperatures
  }

 created() {
   temperatures.GetTemperatures()
 }
 
}
</script>

<style lang="scss" scoped>
  .container {
    display: flex;
    flex-direction: column;
  }
  .temp {
    color: #fff;
  }
</style>

