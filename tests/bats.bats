@test "it returns the version of bats" {
  docker run -t "${DOCKER_IMAGE_NAME}:${BUILD_TAG}" --version
}

@test "Bash is installed" {
  docker run --entrypoint sh "${DOCKER_IMAGE_NAME}:${BUILD_TAG}" -c "which bash"
}

@test "Docker is installed" {
  docker --version
}
