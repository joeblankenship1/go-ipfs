
node {
	def VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()

	def run = {String cmd -> 
		sh "docker run quay.io/ipfs/go-ipfs:$VERSION $cmd"
	}

	stage("Prep") {
		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
	stage("Build") {
		run "make build"
	}
	stage("Build2") {
		run "make build"
	}

	sh "rm $CACHE_DIR"
}
