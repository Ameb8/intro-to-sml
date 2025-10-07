from pathlib import Path
import yaml
from typing import Any
import tempfile

TEST_FILE_NAME = "test.sml"

def load_tests() -> list[dict[str, any]]:
    '''
    Loads test data from yaml file
    '''
    # Get path to yaml file
    current_dir = Path(__file__).parent
    yaml_path = current_dir / '..' / 'test_cases' / 'tests.yaml'
    yaml_path = yaml_path.resolve()

    # Load yaml file
    with open(yaml_path, 'r') as file:
        return yaml.safe_load(file) # Return data as list

def create_sml_file() -> Path:
    '''
    Create temp directory and sml file
    '''
    temp_dir = Path(tempfile.mkdtemp())
    return temp_dir / TEST_FILE_NAME    

def test_function(test_func: dict[str, any], test_file: Path) -> None:
    '''
    Conduct test for sml function argument
    '''
    func_name: str = test_func["name"]
    cases: list[dict[str, str]] = test_func["cases"]

    for case in cases:
        write_test_file()
        test_case()



def run_test() -> None:
    test_data = load_tests()
    test_file = create_sml_file()

    for func in test_data:
        test_function(func, test_file)
        

    