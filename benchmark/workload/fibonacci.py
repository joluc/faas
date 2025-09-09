#!/usr/bin/env python3
"""
CPU-Intensive Fibonacci Workload for FaaS Benchmarking

This workload generates a CPU-intensive task using recursive Fibonacci calculation.
Time complexity: O(2^n)
Designed to stress Function-as-a-Service platforms for performance testing.

Research: Benchmarking Open-Source FaaS Platforms (2019)
Author: Jonathan Schwarze, TU Berlin
"""

import time
import json


def fibonacci(n):
    """
    Recursive Fibonacci calculation with exponential time complexity.

    Args:
        n (int): Position in Fibonacci sequence

    Returns:
        int: Fibonacci number at position n
    """
    if n == 1 or n == 2:
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)


def handler(event, context=None):
    """
    FaaS handler function for OpenFaaS platform.

    Args:
        event: HTTP request data
        context: Function execution context (optional)

    Returns:
        dict: Response with execution time and result
    """
    start_time = time.time()

    # Default Fibonacci position for benchmarking
    n = 35

    # Parse input if provided
    try:
        if isinstance(event, str):
            data = json.loads(event)
        elif isinstance(event, dict):
            data = event
        else:
            data = {}

        n = data.get('n', 35)
    except (json.JSONDecodeError, AttributeError):
        n = 35

    # Ensure reasonable bounds for testing
    n = max(1, min(n, 40))

    # Calculate Fibonacci number
    result = fibonacci(n)

    end_time = time.time()
    execution_time = end_time - start_time

    response = {
        'statusCode': 200,
        'body': {
            'n': n,
            'fibonacci': result,
            'execution_time': execution_time,
            'timestamp': end_time
        }
    }

    return response


def main(req):
    """
    Fission handler function.

    Args:
        req: HTTP request object

    Returns:
        dict: Response with execution time and result
    """
    start_time = time.time()

    # Default Fibonacci position
    n = 35

    # Parse request if available
    try:
        if hasattr(req, 'get_json'):
            data = req.get_json() or {}
        elif hasattr(req, 'json'):
            data = req.json or {}
        else:
            data = {}

        n = data.get('n', 35)
    except:
        n = 35

    # Ensure reasonable bounds
    n = max(1, min(n, 40))

    # Calculate Fibonacci number
    result = fibonacci(n)

    end_time = time.time()
    execution_time = end_time - start_time

    return {
        'n': n,
        'fibonacci': result,
        'execution_time': execution_time,
        'timestamp': end_time
    }


def handle(event, context):
    """
    Kubeless handler function.

    Args:
        event: Event data
        context: Function context

    Returns:
        dict: Response with execution time and result
    """
    start_time = time.time()

    # Default Fibonacci position
    n = 35

    # Parse event data
    try:
        if 'data' in event:
            data = event['data']
        else:
            data = event

        n = data.get('n', 35)
    except:
        n = 35

    # Ensure reasonable bounds
    n = max(1, min(n, 40))

    # Calculate Fibonacci number
    result = fibonacci(n)

    end_time = time.time()
    execution_time = end_time - start_time

    return {
        'n': n,
        'fibonacci': result,
        'execution_time': execution_time,
        'timestamp': end_time
    }


if __name__ == "__main__":
    # For local testing
    test_event = {'n': 30}
    print("Testing Fibonacci workload...")
    print(f"Input: {test_event}")
    result = handler(test_event)
    print(f"Result: {result}")
