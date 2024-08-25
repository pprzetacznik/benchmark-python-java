from time import time

def test():
    iterations = 10000000
    counts = set()
    start_time = time();
    for i in range(0, iterations):
        counts.add(i)
    total_time = time() - start_time
    output = f"TOTAL TIME = {total_time:0.2f}s\n{len(counts)}"
    print(output)
    return output

def lambda_handler(event, context):
    return test()

if __name__ == "__main__":
    test()
