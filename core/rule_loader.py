import os
import yaml

def load_rules(directory="rules_files"):
    rules = []

    if not os.path.exists(directory):
        raise FileNotFoundError(f"Directory '{directory}' does not exist.")

    for filename in os.listdir(directory):
        if filename.endswith(".yaml") or filename.endswith(".yml"):
            filepath = os.path.join(directory, filename)
            with open(filepath, "r", encoding="utf-8") as file:
                try:
                    rule_data = yaml.safe_load(file)
                    if isinstance(rule_data, list):
                        rules.extend(rule_data)
                    else:
                        rules.append(rule_data)
                except yaml.YAMLError as e:
                    print(f"Error loading YAML file {filename}: {e}")

    return rules
