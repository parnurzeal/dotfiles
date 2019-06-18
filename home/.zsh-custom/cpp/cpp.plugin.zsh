# Set alais for c++11 in mac as the default is the old c++.
if [[ "${DOT_OS}" == "OSX" ]]; then
  echo "[c++] Set g++ alias to clang++ (c++11) in OSX."
  alias g++="clang++ -std=c++11 -stdlib=libc++ -Weverything -Wno-c++98-compat -Wno-sign-conversion"
fi
