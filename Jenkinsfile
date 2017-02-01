node {
	def VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()
	def CACHE_DIR = sh(returnStdout: true, script: "mktemp go-ipfs.cache.XXXXXXXX").trim()

	stage("Prep") {
		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
	stage("Build") {
		sh "docker run -v $CACHE_DIR:/go/pkg/ quay.io/ipfs/go-ipfs:$VERSION"
	}
	stage("Build2") {
		sh "docker run -v $CACHE_DIR:/go/pkg/ quay.io/ipfs/go-ipfs:$VERSION"
	}

	sh "rm $CACHE_DIR"
}
