<template>
  <div class="centered">
    <h3 v-if="isLogin">Login</h3>
    <h3 v-if="!isLogin">Register</h3>
    <div class="container">
      <div class="options">
        <a href="#" v-if="!isLogin" v-on:click="isLogin = true">Go to Login</a>
        <a href="#" v-if="isLogin" v-on:click="isLogin = false">Go to Register </a>
      </div>
      <div v-if="isLogin">
        <form class="form">
          <div>
            <label for="email">Email</label>
            <input type="email" v-model="email" id="email" required>
          </div>
          <div>
            <label for="password">Password</label>
            <input type="password" v-model="password" id="password" required>
          </div>
          <input type="submit" value="Login" class="btn" @click="login">
        </form>
      </div>
      <div v-else v-bind:class="'changeContainer'">
        <form class="form">
          <div>
            <label for="name">Name</label>
            <input type="text" v-model="name" id="name" required>
          </div>
          <div>
            <label for="lastname">Last Name</label>
            <input type="text" v-model="lastname" id="lastname" required>        
          </div>
          <div>
            <label for="email">Email</label>
            <input type="email" v-model="email" id="email" required>
          </div>
          <div>
            <label for="password">Password</label>
            <input type="password" v-model="password" id="password" required>
          </div>
          <input type="submit" value="Register" class="btn" @click="register">
        </form>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import {Component} from 'vue-property-decorator';
import users from '@/store/modules/User';
import { ILogin, IRegister } from "@/store/models";

@Component({
  name: "Auth",
})
export default class Auth extends Vue{
  isLogin = true;
  name = "";
  lastname = "";
  email = "";
  password = "";
  loginError = "";
  registerError = "";

  login() {
    if (this.email != "" || this.password != "") {
      const user: ILogin = {email: this.email, password: this.password};
      users.Login(user)
      .then(() => this.$router.push('/main'))
      .catch((err) => {
        console.error(err);
        this.loginError = 'Invalid username or password';
      })
    } else {
      console.log("Faltan argumentos");
    }
  }

  register() {
    if (this.email != "" || this.password != "" || this.name != "" || this.lastname != "") {
      const user: IRegister = {email: this.email, password: this.password, name: this.name, lastname: this.lastname};
      users.Register(user)
      .then(() => {
        this.$router.push('/main');
      })
      .catch((err) => {
        console.error(err);
        this.registerError = 'Invalid username or password';
      })
    } else {
      console.log("Faltan argumentos");
    }
  }
}
</script>

<style lang="scss" scoped>
  .centered {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  h3 {
    font-size: 1.5rem;
    color: #fff;
  }
  .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: .5rem;
    background: #1A1A1B;
    width: 300px;
    height: 300px;
  }
  .changeContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: .5rem;
    background: #1A1A1B;
    width: 300px;
    height: 500px;
  }

  label {
    display: block;
    color: #D7DADC;
    font-size: 1.5rem;
    font-weight: bold;
    margin-top: 5px;
  }

  input {
    width: 250px;
    height: 50px;
    font-size: 1rem;
  }

  .btn {
    color:#D7DADC;
    font-size: .9rem;
    margin-top: 20px;  
    margin-bottom: 5px;
    cursor: pointer;
    background-color: transparent;
    border: 1px solid #fff;
    border-radius: 4px;
    box-sizing: border-box;
    text-align: center;
    text-decoration: none;
    font-weight: bold;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: all 0.5s;

    &:hover {
      background: rgb(116, 51, 221);
    }
  }

  .options {
    a {
      color: #D7DADC;
      margin-top: 5px;
      border: none;
      cursor: pointer;
      font-size: 1rem;
      text-decoration: none;
      transition: all 0.5s;

      &:hover {
        color: rgb(157, 100, 248);
      }
    }
  }
</style>