def pytest_addoption(parser):
    parser.addoption(
        "--target",
        action="store",
        help="Target SML file name"
    )
