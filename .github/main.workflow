workflow "New workflow" {
  on = "push"
  jobs:
    lint:
      name: Lint
      runs-on:  ubuntu-latest
      steps:
      
      - name: Set up go
      uses: actions/setup-go@v1
      with:
        go-version: 1.12
        
      - name: Check out code
      uses: actions/checkout@v1
      
      - name: Lint Go Code
      run: |
        export PATH=$PATH:$(go env PATH)/bin
        go get -u golang.org/x/lint/golint
        make lint
        
    test:
      name: test
      runs-on:  ubuntu-latest
      steps:
      
      - name: Set up go
      uses: actions/setup-go@v1
      with:
        go-version: 1.12
        
      - name: Check out code
      uses: actions/checkout@v1
      
      - name: Run unit tests
      run: make test-coverage
      
      - name： Upload Coverage report to CodeCov
      uses: codecov/codecov-action@v1.0.0
      with:
        token:${{secrets.CODECOV_TOKEN}}
        file:./coverage.txt
    
    build:
      name:  Build
      runs-on: ubuntu-latest
      need: [lint,test]
      steps:
      
      - name: Set up go
      uses: actions/setup-go@v1
      with:
        go-version: 1.12
        
      - name: Check out code
      uses: actions/checkout@v1
      
      - name: Build
      run: make build
        
}
