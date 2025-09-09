#!/bin/bash
#
# Automated FaaS Platform Benchmarking Script
# Research: Benchmarking Open-Source FaaS Platforms (2019)
# Author: Jonathan Schwarze, TU Berlin
#
# This script automates the execution of HTTP load tests against FaaS platforms
# using the 'hey' load generator with incremental concurrency levels.
#

set -e

# Configuration
REQUESTS=10000
RESULT_DIR="./results"
LOG_FILE="benchmark_$(date +%Y%m%d_%H%M%S).log"

# Ensure results directory exists
mkdir -p "$RESULT_DIR"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Function to run benchmark for a specific concurrency level
run_benchmark() {
    local url=$1
    local concurrency=$2
    local platform=$3
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local output_file="${RESULT_DIR}/benchmark_${platform}_c${concurrency}_${timestamp}.txt"

    log "Starting benchmark for $platform with concurrency $concurrency"
    log "URL: $url"
    log "Requests: $REQUESTS"
    log "Output: $output_file"

    # Run hey with specified parameters
    hey -n "$REQUESTS" -c "$concurrency" -o csv "$url" > "$output_file" 2>&1

    if [ $? -eq 0 ]; then
        log "Benchmark completed successfully for $platform (c=$concurrency)"
    else
        log "ERROR: Benchmark failed for $platform (c=$concurrency)"
        return 1
    fi

    # Extract key metrics
    local total_time=$(grep "Total:" "$output_file" | awk '{print $2}')
    local requests_per_sec=$(grep "Requests/sec:" "$output_file" | awk '{print $2}')
    local mean_latency=$(grep "Mean:" "$output_file" | awk '{print $2}')

    log "Results - Total: $total_time, RPS: $requests_per_sec, Mean Latency: $mean_latency"

    return 0
}

# Function to run full benchmark suite
run_full_benchmark() {
    local platform=$1
    local url=$2

    log "Starting full benchmark suite for $platform"
    log "Target URL: $url"

    # Test connectivity
    log "Testing connectivity to $url"
    if ! curl -s -o /dev/null -w "%{http_code}" "$url" | grep -q "200"; then
        log "WARNING: Target URL may not be responding correctly"
    fi

    # Concurrency levels: 1-10 (step 1), 20-50 (step 10), 100-200 (step 50)
    local concurrency_levels=(1 2 3 4 5 6 7 8 9 10 20 30 40 50 100 150 200)

    for concurrency in "${concurrency_levels[@]}"; do
        # Run benchmark
        run_benchmark "$url" "$concurrency" "$platform"

        # Wait 30 minutes between tests for cooldown (reduced for testing)
        if [ "$concurrency" != "200" ]; then
            local wait_time=${COOLDOWN_TIME:-1800}  # 30 minutes default
            log "Cooling down for $wait_time seconds..."
            sleep "$wait_time"
        fi
    done

    log "Full benchmark suite completed for $platform"
}

# Function to validate environment
validate_environment() {
    log "Validating benchmark environment..."

    # Check if hey is installed
    if ! command -v hey &> /dev/null; then
        log "ERROR: 'hey' load generator not found. Please install it first."
        log "Installation: go get -u github.com/rakyll/hey"
        exit 1
    fi

    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        log "ERROR: 'curl' not found. Please install curl."
        exit 1
    fi

    log "Environment validation completed successfully"
}

# Function to display usage
usage() {
    echo "Usage: $0 [OPTIONS] PLATFORM_NAME TARGET_URL"
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help              Show this help message"
    echo "  -r, --requests NUM      Number of requests (default: 10000)"
    echo "  -c, --concurrency NUM   Single concurrency test"
    echo "  -w, --wait-time SEC     Cooldown time between tests (default: 1800)"
    echo "  --dry-run               Validate setup without running tests"
    echo ""
    echo "EXAMPLES:"
    echo "  $0 fission http://fission.example.com/fn"
    echo "  $0 -c 10 kubeless http://kubeless.example.com/fn"
    echo "  $0 --dry-run openfaas http://openfaas.example.com/function/fn"
    echo ""
    echo "SUPPORTED PLATFORMS:"
    echo "  - fission"
    echo "  - kubeless"
    echo "  - openfaas"
    echo "  - openwhisk"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        -r|--requests)
            REQUESTS="$2"
            shift 2
            ;;
        -c|--concurrency)
            SINGLE_CONCURRENCY="$2"
            shift 2
            ;;
        -w|--wait-time)
            COOLDOWN_TIME="$2"
            shift 2
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -*)
            log "ERROR: Unknown option $1"
            usage
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

# Validate required arguments
if [[ $# -lt 2 ]] && [[ -z "$DRY_RUN" ]]; then
    log "ERROR: Missing required arguments"
    usage
    exit 1
fi

PLATFORM_NAME="$1"
TARGET_URL="$2"

# Main execution
main() {
    log "=== FaaS Platform Benchmark Starting ==="
    log "Platform: $PLATFORM_NAME"
    log "Target URL: $TARGET_URL"
    log "Requests per test: $REQUESTS"
    log "Results directory: $RESULT_DIR"

    # Validate environment
    validate_environment

    # Dry run mode
    if [[ "$DRY_RUN" == "true" ]]; then
        log "DRY RUN MODE: Environment validation completed"
        log "Would test platform: $PLATFORM_NAME"
        log "Would target URL: $TARGET_URL"
        exit 0
    fi

    # Single concurrency test
    if [[ -n "$SINGLE_CONCURRENCY" ]]; then
        log "Running single concurrency test (c=$SINGLE_CONCURRENCY)"
        run_benchmark "$TARGET_URL" "$SINGLE_CONCURRENCY" "$PLATFORM_NAME"
        exit 0
    fi

    # Full benchmark suite
    run_full_benchmark "$PLATFORM_NAME" "$TARGET_URL"

    log "=== Benchmark Completed ==="
    log "Results stored in: $RESULT_DIR"
    log "Log file: $LOG_FILE"
}

# Run main function
main "$@"
