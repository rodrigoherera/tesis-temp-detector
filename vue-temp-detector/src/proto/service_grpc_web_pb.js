/**
 * @fileoverview gRPC-Web generated client stub for proto
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck



const grpc = {};
grpc.web = require('grpc-web');

const proto = {};
proto.proto = require('./service_pb.js');

/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?Object} options
 * @constructor
 * @struct
 * @final
 */
proto.proto.BasicServiceClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options['format'] = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?Object} options
 * @constructor
 * @struct
 * @final
 */
proto.proto.BasicServicePromiseClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options['format'] = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.proto.User,
 *   !proto.proto.ServerResponse>}
 */
const methodDescriptor_BasicService_SetUser = new grpc.web.MethodDescriptor(
  '/proto.BasicService/SetUser',
  grpc.web.MethodType.UNARY,
  proto.proto.User,
  proto.proto.ServerResponse,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.ServerResponse.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.proto.User,
 *   !proto.proto.ServerResponse>}
 */
const methodInfo_BasicService_SetUser = new grpc.web.AbstractClientBase.MethodInfo(
  proto.proto.ServerResponse,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.ServerResponse.deserializeBinary
);


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.Error, ?proto.proto.ServerResponse)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.proto.ServerResponse>|undefined}
 *     The XHR Node Readable Stream
 */
proto.proto.BasicServiceClient.prototype.setUser =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/proto.BasicService/SetUser',
      request,
      metadata || {},
      methodDescriptor_BasicService_SetUser,
      callback);
};


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.proto.ServerResponse>}
 *     A native promise that resolves to the response
 */
proto.proto.BasicServicePromiseClient.prototype.setUser =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/proto.BasicService/SetUser',
      request,
      metadata || {},
      methodDescriptor_BasicService_SetUser);
};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.proto.User,
 *   !proto.proto.GetUsers>}
 */
const methodDescriptor_BasicService_GetUser = new grpc.web.MethodDescriptor(
  '/proto.BasicService/GetUser',
  grpc.web.MethodType.UNARY,
  proto.proto.User,
  proto.proto.GetUsers,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.GetUsers.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.proto.User,
 *   !proto.proto.GetUsers>}
 */
const methodInfo_BasicService_GetUser = new grpc.web.AbstractClientBase.MethodInfo(
  proto.proto.GetUsers,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.GetUsers.deserializeBinary
);


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.Error, ?proto.proto.GetUsers)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.proto.GetUsers>|undefined}
 *     The XHR Node Readable Stream
 */
proto.proto.BasicServiceClient.prototype.getUser =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/proto.BasicService/GetUser',
      request,
      metadata || {},
      methodDescriptor_BasicService_GetUser,
      callback);
};


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.proto.GetUsers>}
 *     A native promise that resolves to the response
 */
proto.proto.BasicServicePromiseClient.prototype.getUser =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/proto.BasicService/GetUser',
      request,
      metadata || {},
      methodDescriptor_BasicService_GetUser);
};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.proto.User,
 *   !proto.proto.ServerResponse>}
 */
const methodDescriptor_BasicService_Login = new grpc.web.MethodDescriptor(
  '/proto.BasicService/Login',
  grpc.web.MethodType.UNARY,
  proto.proto.User,
  proto.proto.ServerResponse,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.ServerResponse.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.proto.User,
 *   !proto.proto.ServerResponse>}
 */
const methodInfo_BasicService_Login = new grpc.web.AbstractClientBase.MethodInfo(
  proto.proto.ServerResponse,
  /**
   * @param {!proto.proto.User} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.ServerResponse.deserializeBinary
);


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.Error, ?proto.proto.ServerResponse)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.proto.ServerResponse>|undefined}
 *     The XHR Node Readable Stream
 */
proto.proto.BasicServiceClient.prototype.login =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/proto.BasicService/Login',
      request,
      metadata || {},
      methodDescriptor_BasicService_Login,
      callback);
};


/**
 * @param {!proto.proto.User} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.proto.ServerResponse>}
 *     A native promise that resolves to the response
 */
proto.proto.BasicServicePromiseClient.prototype.login =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/proto.BasicService/Login',
      request,
      metadata || {},
      methodDescriptor_BasicService_Login);
};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.proto.Temperature,
 *   !proto.proto.GetTemperatures>}
 */
const methodDescriptor_BasicService_Get = new grpc.web.MethodDescriptor(
  '/proto.BasicService/Get',
  grpc.web.MethodType.UNARY,
  proto.proto.Temperature,
  proto.proto.GetTemperatures,
  /**
   * @param {!proto.proto.Temperature} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.GetTemperatures.deserializeBinary
);


/**
 * @const
 * @type {!grpc.web.AbstractClientBase.MethodInfo<
 *   !proto.proto.Temperature,
 *   !proto.proto.GetTemperatures>}
 */
const methodInfo_BasicService_Get = new grpc.web.AbstractClientBase.MethodInfo(
  proto.proto.GetTemperatures,
  /**
   * @param {!proto.proto.Temperature} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.proto.GetTemperatures.deserializeBinary
);


/**
 * @param {!proto.proto.Temperature} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.Error, ?proto.proto.GetTemperatures)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.proto.GetTemperatures>|undefined}
 *     The XHR Node Readable Stream
 */
proto.proto.BasicServiceClient.prototype.get =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/proto.BasicService/Get',
      request,
      metadata || {},
      methodDescriptor_BasicService_Get,
      callback);
};


/**
 * @param {!proto.proto.Temperature} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.proto.GetTemperatures>}
 *     A native promise that resolves to the response
 */
proto.proto.BasicServicePromiseClient.prototype.get =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/proto.BasicService/Get',
      request,
      metadata || {},
      methodDescriptor_BasicService_Get);
};


module.exports = proto.proto;

