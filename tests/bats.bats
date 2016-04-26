BATS_VERSION=0.4.0

@test "it returns the version of bats" {
  docker run -t "${DOCKER_IMAGE_NAME}:${BUILD_TAG}" | grep "Bats" | grep "${BATS_VERSION}"
}

@test "Bash is installed" {
  docker run --entrypoint sh "${DOCKER_IMAGE_NAME}:${BUILD_TAG}" -c "which bash"
}
