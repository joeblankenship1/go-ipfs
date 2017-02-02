node {
	def VERSION = "latest"

	def run = {String cmd, Map env = null ->
		def defEnv = [TERM: 'xterm-color', TEST_NO_FUSE: '1', TEST_VERBOSE: '1'] as Map
		if (env != null) {
			for (e in env.entrySet()) {
				defEnv[e.getKey()] = e.getValue()
			}
		}
		def envStr = ""
		for (e in defEnv.entrySet()) {
			envStr = envStr + "-e '${e.getKey()}=${e.getValue()}' "
		}
		sh "docker run $envStr quay.io/ipfs/go-ipfs:$VERSION $cmd"
	}

	stage("Prep") {
		checkout scm
		VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()

		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
	stage("Build") {
		run "make build"
	}
	stage("Test") {
		ansiColor('xterm') {
			run("make test", [color: 't'])
		}
	}
}
