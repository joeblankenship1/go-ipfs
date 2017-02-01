node {
	def VERSION = "latest"
	stage("Checkout") {
		git branch: 'feat/makefile/refactor', url: 'https://github.com/ipfs/go-ipfs.git'
		VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()
	}
	stage("Prep") {
		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
	stage("Build") {
		sh "docker run quay.io/ipfs/go-ipfs:$VERSION"
	}
}
