{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
}:

let
  highway = fetchFromGitHub {
    owner = "google";
    repo = "highway";
    rev = "c5bebf84ad01edec97e336f5c97ca4e0df6b4d06";
    hash = "sha256-RyPa0AYK+ZXTndudwTarLw5zPWawr43VkeiT6br/ws0=";
  };

  sentencepiece = fetchFromGitHub {
    owner = "google";
    repo = "sentencepiece";
    rev = "53de76561cfc149d3c01037f0595669ad32a5e7c";
    hash = "sha256-IS7h5M4Q1u3LLhk8qM1Af7KsEgOQn/YWr3llXqyMU0Y=";
  };

  nlohmann_json = fetchFromGitHub {
    owner = "nlohmann";
    repo = "json";
    rev = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03";
    hash = "sha256-7F0Jon+1oWL7uqet5i1IgHX0fUw/+z0QwEcA3zs5xHg=";
  };

  google_benchmark = fetchFromGitHub {
    owner = "google";
    repo = "benchmark";
    tag = "v1.8.2";
    hash = "sha256-mydcW6G1R13lGTsuJ0pxCJBUovy1OmQEagg11g9f4tw=";
  };
in

stdenv.mkDerivation (finalAttrs: {
  pname = "gemma-cpp";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "google";
    repo = "gemma.cpp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-MNk3JWaQPZsOAKgEBdyDDg5jPUz7GdRp3r+VH1kUVFs=";
  };

  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [
    (lib.cmakeFeature "FETCHCONTENT_SOURCE_DIR_HIGHWAY" "${highway}")
    (lib.cmakeFeature "FETCHCONTENT_SOURCE_DIR_SENTENCEPIECE" "${sentencepiece}")
    (lib.cmakeFeature "FETCHCONTENT_SOURCE_DIR_JSON" "${nlohmann_json}")
    (lib.cmakeFeature "FETCHCONTENT_SOURCE_DIR_BENCHMARK" "${google_benchmark}")
    (lib.cmakeBool "SPM_ENABLE_SHARED" false)
    (lib.cmakeFeature "SPM_ABSL_PROVIDER" "internal")
    (lib.cmakeBool "GEMMA_ENABLE_TESTS" false)
    (lib.cmakeBool "BENCHMARK_ENABLE_TESTING" false)
    (lib.cmakeBool "BENCHMARK_ENABLE_GTEST_TESTS" false)
    (lib.cmakeFeature "CMAKE_POLICY_VERSION_MINIMUM" "3.5")
  ];

  meta = {
    description = "Lightweight, standalone C++ inference engine for Google's Gemma models";
    homepage = "https://github.com/google/gemma.cpp";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    mainProgram = "gemma";
  };
})
