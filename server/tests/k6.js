import http from 'k6/http';

export let options = {
  insecureSkipTLSVerify: true,
  noConnectionReuse: false,
  scenarios: {
    constant_request_rate: {
      executor: 'constant-arrival-rate',
      rate: 300,
      timeUnit: '1s', // 1000 iterations per second, i.e. 1000 RPS
      duration: '30s',
      preAllocatedVUs: 20, // how large the initial pool of VUs would be
      maxVUs: 200, // if the preAllocatedVUs are not enough, we can initialize more
    },
  },
};

export default () => {
  http.get(`http://localhost:3000/products`);

  // http.get(`http://localhost:3000/products/${Math.floor(Math.random() * 99999)}`);

  // http.get(`http://localhost:3000/products/${Math.floor(Math.random() * 99999)}/styles`);

  // http.get(`http://localhost:3000/products/${Math.floor(Math.random() * 99999)}/related`);
}
