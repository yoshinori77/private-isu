// localhost以外を対象にする場合はここを書き換えれば良い
const BASE_URL = "http://localhost";

export function url(path) {
  return `${BASE_URL}${path}`;
}
