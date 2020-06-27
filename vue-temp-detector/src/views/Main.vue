<template>
  <div class="container">
    <div v-if="user != null">
      <h3>{{email}}</h3>
    </div>
    <div v-else>
      <h3>Necesita loguearse</h3>
    </div>
    <TemperatureFilter />
    <TemperatureList />
  </div>  
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import users from '@/store/modules/User';
import TemperatureList from '../components/TemperatureList.vue';
import TemperatureFilter from '../components/TemperatureFilter.vue';

@Component({
  name: "Main",
  components: {
    TemperatureList,
    TemperatureFilter
  }
})
export default class Main extends Vue {

  get email() {
    return users.Email;
  }
  get user() {
    return users.User;
  }

  created() {
    users.GetUsers();
    return users.User;
  }
}

</script>

<style lang="scss" scoped>
  .container {
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  h3 {
    color: #fff;
  }
</style>