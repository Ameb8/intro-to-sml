from pathlib import Path
import yaml
from typing import Any

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

def run_test():
    test_data: list[dict[str, any]] = load_tests();

    