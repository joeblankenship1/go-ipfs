def VERSION = "latest"


def run(String VERSION, String cmd, Map env = null) {
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

ansiColor('xterm') {
withEnv(["TERM=xterm-color"]){

stage("Build Container") {
	node {
		checkout scm
		VERSION = sh(returnStdout: true, script: "git rev-parse HEAD").trim()

		sh "docker build -t quay.io/ipfs/go-ipfs:$VERSION -f dockerfiles/Dockerfile.buildenv ."
	}
}

stage("Checks") {
	parallel(
		'go fmt': { node {
			sh 'echo go fmt'
			run VERSION, 'make test_go_fmt'
		}},
		'go build': { node {
			sh 'echo go build'
			run VERSION, 'make cmd/ipfs/ipfs'
		}}
	)
}

stage("Tests") {
	parallel(
		'sharness': { node {
			sh 'echo make test_sharness_expensive'
			run(VERSION, 'make test_sharness_expensive', [color: 't'])
		}},
		'go test': { node {
			sh 'echo make test_go_expensive'
			run VERSION, 'make test_go_expensive'
		}}
	)
}}}
