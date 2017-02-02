node {
	def VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()

		def run = {String cmd ->
			sh "docker run quay.io/ipfs/go-ipfs:$VERSION $cmd"
		}

	withEnv(["TEST_NO_FUSE=1"]) {
		stage("Prep") {
			sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
		}
		stage("Build") {
			run "make build"
		}
		stage("Test") {
			run "make test"
		}
	}
}
