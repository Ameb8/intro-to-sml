from pathlib import Path
import yaml
from typing import Any
import tempfile
import subprocess
import shutil
import pytest


TEST_FILE_NAME: str = "test.sml"


@pytest.fixture(scope="session")
def target_file(request):
    target_name = request.config.getoption("--target")
    repo_root = Path(__file__).parent.parent.resolve()
    return repo_root / "src" / "individual_work" / target_name


@pytest.fixture(scope="session")
def test_file():
    # Create test sml file in temp directory
    temp_dir = Path(tempfile.mkdtemp())
    test_file = temp_dir / TEST_FILE_NAME

    # Run tests then delete directory
    yield test_file
    shutil.rmtree(temp_dir)


def create_test_params(func: dict[str, any]) -> list[tuple[str, str, str]]:
    '''
    Zip test case data in tlist of tuples for parametrize
    '''
    return [(func["name"], case["args"], case["expected"]) for case in func["cases"]]


def load_tests() -> list[dict[str, any]]:
    '''
    Loads test data from yaml file
    '''
    # Get path to yaml file
    current_dir = Path(__file__).parent
    yaml_path = current_dir / 'test_cases' / 'tests.yaml'
    yaml_path = yaml_path.resolve()

    # Load yaml file
    with open(yaml_path, 'r') as file:
        data = yaml.safe_load(file)
        print(f"\nYAML DATA:\n\n{data}\n") # DEBUG ***
        return data
        #return yaml.safe_load(file) # Return data as list
    

def generate_test_cases() -> list[tuple[str, str, str]]:
    '''
    Generate list of tuples for all test cases in tests.yaml
    '''

    # DEBUG *******
    raw_data = load_tests()
    print(f"Raw YAML data: {raw_data}")  # DEBUG ***
    # END DEBUG ***
    
    lst = [case for func in load_tests() for case in create_test_params(func)]
    print(f"List: {lst}")
    return lst


def write_test_file(test_file: Path, name: str, args: str, target_file: Path) -> None:
    func_call = f"use {str(target_file)};\n{name}{args};"
    test_file.write_text(func_call, encoding='utf-8')

@pytest.mark.parametrize("func, args, expected", generate_test_cases())
def run_test(func: str, args: str, expected: str, test_file: Path, target_file: Path):
    print("\nTest Running!")
    write_test_file(test_file, func, args, target_file)
    result = subprocess.run(
        ["sml", str(test_file)],
        capture_output=True,
        text=True
    )

    assert result.stdout.strip() == expected.strip()
