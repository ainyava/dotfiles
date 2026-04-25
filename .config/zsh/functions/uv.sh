function uvvenv() {
  uv virtualenv ~/.uv/$1;
}
function uvsrc() {
  source ~/.uv/$1/bin/activate;
}

