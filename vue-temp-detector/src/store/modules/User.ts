import {
  VuexModule,
  Module,
  Mutation,
  Action,
  config,
  getModule,
} from "vuex-module-decorators";
import store from "@/store";
import { IUser } from "@/store/models";
import { User } from '@/proto/service_pb';
import { BasicServiceClient } from '@/proto/service_grpc_web_pb';
config.rawError = true;
@Module({
  namespaced: true,
  dynamic: true,
  store,
  name: "users",
})
class UserStore extends VuexModule {
  users: User[] = [];
  user!: IUser;

  get Users() {
    return this.users;
  }

  get User() {
    return this.user || null;
  }


  @Mutation
  _setUsers(userArr: User[]) {
    this.users = userArr;
  }

  @Mutation
  _login(response: Uint8Array) {
    const string = new TextDecoder("utf-8").decode(response); 
    const obj = JSON.parse(string)
    let userObj!: IUser;
    userObj.id = obj['id'];
    userObj.email = obj['email'];
    userObj.name = obj['name'];
    userObj.jwt = obj['jwt'];

    this.user = userObj;
  }

  @Action({ commit: "_login" })
  async Login(email: string, password: string) {
    const client = new BasicServiceClient("http://localhost:8080", null, null);
    const newUser = new User();
    newUser.setEmail(email);
    newUser.setPassword(password);
    client.login(newUser, {}, (err, res) => {
      console.log("res", res)
      console.log("err", err)
      // if (res.getSuccess()) {
      //   return res.getValue();
      // }else {
      //   console.error(res.getError(), err);
      //   return null
      // }
    });
  }

  @Action({ commit: "_login" })
  async Register(email: string, password: string, name: string, lastname: string) {
    const client = new BasicServiceClient("http://localhost:8000", null, null);
    const newUser = new User();
    newUser.setName(name);
    newUser.setLastName(lastname);
    newUser.setEmail(email);
    newUser.setPassword(password);
    newUser.setAdmin(true);

    client.setUser(newUser, {}, (err, res) => {
      console.log(res);
      if (!err) {
        return res.getValue();
      }else {
        console.error(res.getError(), err);
        return null
      }
    });
  }

  @Action({ commit: "_setUsers" })
  async getUsers() {
    const client = new BasicServiceClient("http://localhost:4040", null, null);
    const newUser = new User();
    client.getUser(newUser, {}, (err, res) => {
      if (!err) {
        return res.getUserList();
      }else{
        console.error(err);
        return null 
      }
    });

  }
}

export default getModule(UserStore);
