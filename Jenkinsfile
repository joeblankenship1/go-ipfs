node {
	def VERSION = "latest"
	def CACHE_DIR = "/tmp/go-ipfs-build-cache"
	sh(script: "mkdir -f $CACHE_DIR")

	stage("Checkout") {
		git branch: 'feat/makefile/refactor', url: 'https://github.com/ipfs/go-ipfs.git'
		VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()
	}
	stage("Prep") {
		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
	stage("Build") {
		sh "docker run -v "$CACHE_DIR:/go/pkg/" quay.io/ipfs/go-ipfs:$VERSION"
	}
}
