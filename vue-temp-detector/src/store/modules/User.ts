import {
  VuexModule,
  Module,
  Mutation,
  Action,
  config,
  getModule,
} from "vuex-module-decorators";
import store from "@/store";
import { IUser, ILogin, IRegister } from "@/store/models";
import { User, ServerResponse, GetUsers } from "@/proto/service_pb";
import { LoginGRPC, RegisterGRPC, GetAllUsers } from './Api';
import { ClientReadableStream } from 'grpc-web';
config.rawError = true;

@Module({
  namespaced: true,
  dynamic: true,
  store,
  name: "users",
})
class UserStore extends VuexModule {
  users: IUser[] = [];
  user: IUser | null = null;

  get Users() {
    return this.users;
  }

  get Email() {
    if (this.user != null) {
      return this.user.email;
    }
  }

  get User() {
    return this.user || null;
  }

  @Mutation
  _setUsers(response:  ClientReadableStream<GetUsers>) {
    const userArr: IUser[] =[];
    response.on('data', data => {
      const usrStatic: IUser = {id: 0, name: "All", lastname: "", email: "", jwt: ""};
      const usr = data.getUserList();
      userArr.push(usrStatic);
      if (usr.length > 0) {
        for (let index = 0; index < usr.length; index++) {
          const item: IUser = {
            id: usr[index].getId(),
            name: usr[index].getName(),
            lastname: usr[index].getLastName(),
            email: usr[index].getEmail(),
            jwt: "", 
          }
          userArr.push(item);
        }   
      }
    })
    this.users = userArr;
  }

  @Mutation
  _login(response:  ClientReadableStream<ServerResponse>) {

    response.on('data', data => {
      let str = "";
      const value = data.getValue_asU8();
      for (let i = 0; i < value.length; i++) {
        str += String.fromCharCode(value[i]);
      }
      const val: IUser= JSON.parse(str)
      this.user = {id: val.id, name: val.name, lastname: "", email: val.email, jwt: val.jwt};
    })
  }

  @Action({ commit: "_login" })
  async Login(user: ILogin) {
    const newUser = new User();
    newUser.setEmail(user.email);
    newUser.setPassword(user.password);
    const ret = await LoginGRPC(newUser)
    return ret;
  }

  @Action({ commit: "_login" })
  async Register(user: IRegister ) {
    const newUser = new User();
    newUser.setName(user.name);
    newUser.setLastName(user.lastname);
    newUser.setEmail(user.email);
    newUser.setPassword(user.password);
    newUser.setAdmin(true);
    return await RegisterGRPC(newUser)
  }

  @Action({ commit: "_setUsers" })
  async GetUsers() {
    const newUser = new User();
    newUser.setId(0);
    return await GetAllUsers(newUser);
  }
}

export default getModule(UserStore);
