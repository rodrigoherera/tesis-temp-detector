import { VuexModule, Module, Mutation, Action, config, getModule} from 'vuex-module-decorators';
import store from '@/store'

config.rawError = true;
@Module({
  namespaced: true,
  dynamic: true,
  store,
  name: 'temperatures'
})
class TemperatureStore extends VuexModule {

}

export default getModule(TemperatureStore);
