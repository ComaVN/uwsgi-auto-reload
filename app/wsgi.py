import sys


def application(environ, start_response):
    print('stdout')
    print(
        'stderr',
        file=sys.stderr,
    )
    start_response('200', [])
    yield b"Hello, World\n"
