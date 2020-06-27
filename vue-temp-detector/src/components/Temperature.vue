<template>
  <div class="container">
    <div class="items">
      <div>
        <p>Nombre</p>
        <div v-bind:key="user.id" v-for="user in users">
          <div v-if="temperature.userId == user.id">
            <p>{{user.name}}</p>
          </div>
        </div>
      </div>
      <div>
        <p>Apellido</p>
        <div v-bind:key="user.id" v-for="user in users">
          <div v-if="temperature.userId == user.id">
            <p>{{user.lastname}}</p>
          </div>
        </div>
      </div>
      <div v-bind:class="{'eval-color':parseInt(temperature.value) > 37}">
        <p>Valor</p>
        <p class="temp-color" >{{temperature.value}}</p>
      </div>
      <div>
        <p> Fecha </p>
        <p>{{temperature.date}} </p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Component from 'vue-class-component';
import { Prop } from 'vue-property-decorator';
import { ITemperature } from '../store/models';
import users from '@/store/modules/User';

@Component({
  name: "Temperature"
})
export default class Temperature extends Vue{
  @Prop({ required: true, type: Object}) temperature!: ITemperature
  
  get users() {
    return users.Users;
  }

  created() {
    return users.Users
  }
}
</script>

<style lang="scss" scoped>
  .items {
    padding: 0;
    width: 350px;
    display: flex;
    justify-content: space-around;
    margin-bottom: 10px;
    p {
      color: #fff;
    }
    .temp-color {
      color:green;
    }
    .eval-color {
      p {
        color: red;
      }
    }
  }
</style>