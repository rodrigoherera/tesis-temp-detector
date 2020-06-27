import { User, ServerResponse, Temperature, GetTemperatures, GetUsers } from "@/proto/service_pb";
import { BasicServiceClient } from "@/proto/service_grpc_web_pb";

export async function LoginGRPC(user: User) {
  const client = new BasicServiceClient("http://localhost:4040", null, null);
  return client.login(user, {}, (err, res: ServerResponse) => {
    if (res.getSuccess() == true) {
      return res.getValue();
    } else {
      console.error(err);
      console.error(res.getError());
      return null;
    }
  });
}

export async function RegisterGRPC(user: User) {
  const client = new BasicServiceClient("http://localhost:4040", null, null);
  return client.setUser(user, {}, (err, res: ServerResponse) => {
    if (res.getSuccess() == true) {
      return res.getValue();
    } else {
      console.error(err);
      console.error(res.getError());
      return null;
    }
  });
}

export async function GetTempGRPC(temp: Temperature) {
  const client = new BasicServiceClient("http://localhost:4040", null, null);
  return client.get(temp, {}, (err, res: GetTemperatures) => {
    if (res.getTemperaturesList.length > 0) {
      return res.getTemperaturesList();
    } else {
      console.error(err);
      return null;
    }
  });
}

export async function GetAllUsers(user: User) {
  const client = new BasicServiceClient("http://localhost:4040", null, null);
  return client.getUser(user, {}, (err, res: GetUsers) => {
    if (res.getUserList.length > 0) {
      return res.getUserList();
    } else {
      console.error(err);
      return null;
    }
  });
}

export async function GetTempFilterGRPC(temp: Temperature) {
  const client = new BasicServiceClient("http://localhost:4040", null, null);
  return client.get(temp, {}, (err, res: GetTemperatures) => {
    if (res.getTemperaturesList.length > 0) {
      return res.getTemperaturesList();
    } else {
      console.error(err);
      return null;
    }
  });
}

