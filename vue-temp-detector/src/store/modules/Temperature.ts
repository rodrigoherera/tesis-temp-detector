import { VuexModule, Module, Mutation, Action, config, getModule} from 'vuex-module-decorators';
import store from '@/store'
import { Temperature, GetTemperatures } from '@/proto/service_pb';
import { ClientReadableStream } from 'grpc-web';
import { ITemperature, IFilters } from '../models';
import { GetTempGRPC, GetTempFilterGRPC} from './Api';

config.rawError = true;
@Module({
  namespaced: true,
  dynamic: true,
  store,
  name: 'temperatures'
})
class TemperatureStore extends VuexModule {
  temperatures: ITemperature[] = [];

  get Temperatures() {
    return this.temperatures;
  }

  @Mutation
  _setTemperatures(response: ClientReadableStream<GetTemperatures>) {
    const tempArr: ITemperature[] = [];
    response.on('data', data => {
      const temp = data.getTemperaturesList();
      if (temp.length > 0) {
        for (let index = 0; index < temp.length; index++) {
          const item: ITemperature = {
            userId: temp[index].getUserId(),
            date: temp[index].getDate(),
            value: temp[index].getValue(),
          }
          tempArr.push(item);
        }   
      }
    })
    this.temperatures = tempArr
  }
  @Action({ commit: "_setTemperatures" })
  async GetTemperatures() {
    const temp = new Temperature();
    temp.setUserId(0);
    return await GetTempGRPC(temp)
  }

  @Action({commit: "_setTemperatures"})
  async GetTemperaturesWithFilter(filter: IFilters) {
    const temp = new Temperature();
    temp.setUserId(filter.userId);
    temp.setTo(filter.dateTo);
    temp.setFrom(filter.dateFrom);
    return await GetTempFilterGRPC(temp)
  }
}

export default getModule(TemperatureStore);
