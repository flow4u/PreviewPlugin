import random
import string
import csv
import json
import os

def generate_random_paragraph(num_sentences=5, max_words=20):
    sentences = []
    for _ in range(num_sentences):
        words = [''.join(random.choices(string.ascii_lowercase, k=random.randint(3, 10))) for _ in range(random.randint(5, max_words))]
        words[0] = words[0].capitalize()
        sentences.append(' '.join(words) + '.')
    return ' '.join(sentences)

def generate_long_text_line(length=500):
    return ''.join(random.choices(string.ascii_letters + string.digits + " ,.;:", k=length))

# Ensure we are in the assets directory if run from root
if os.path.basename(os.getcwd()) != 'assets' and os.path.exists('assets'):
    os.chdir('assets')

print("Generating txt, md...")
with open("sample.txt", "w") as f, open("sample.md", "w") as mdf:
    mdf.write("# Very Large Markdown Sample\n\n## Introduction\n\n")
    for _ in range(300): # > 2 pages
        para = generate_random_paragraph()
        f.write(para + "\n\n")
        mdf.write(para + "\n\n")
        
        long_line = generate_long_text_line(800)
        f.write(long_line + "\n\n")
        mdf.write("```\n" + long_line + "\n```\n\n")

print("Generating csv...")
with open("sample.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["ID", "Name", "Description", "DataBlock1", "DataBlock2"])
    for i in range(1500):
        writer.writerow([
            i, 
            f"Item-{i}", 
            generate_random_paragraph(1, 10), 
            generate_long_text_line(300), 
            generate_long_text_line(300)
        ])

print("Generating script (js)...")
with open("sample.js", "w") as f:
    f.write("// Very Long JavaScript Sample\n")
    f.write("const dataStore = [\n")
    for i in range(500):
        f.write("  { id: " + str(i) + ", config: '" + generate_long_text_line(150) + "', flag: " + str(random.choice([True, False])).lower() + " },\n")
    f.write("];\n\n")
    f.write("function processData(store) {\n")
    for i in range(100):
        f.write("    console.log('Processing step " + str(i) + "');\n    store.forEach(item => {\n        if (item.id % 2 === 0) item.flag = !item.flag;\n    });\n")
    f.write("}\nprocessData(dataStore);\n")

print("Generating JSON...")
large_json = [{"id": i, "details": generate_random_paragraph(), "blob": generate_long_text_line(200)} for i in range(1000)]
with open("sample.json", "w") as f:
    json.dump(large_json, f, indent=2)

print("Generating YAML...")
with open("sample.yaml", "w") as f:
    f.write("---\n# Large YAML Configuration\n")
    f.write("metadata:\n  version: 1.0\n  author: Automation\n")
    f.write("items:\n")
    for i in range(400):
        f.write("  - id: " + str(i) + "\n")
        f.write("    name: \"Item " + str(i) + "\"\n")
        f.write("    description: >\n      " + generate_random_paragraph(2, 15) + "\n")
        f.write("    attributes:\n      speed: " + str(random.randint(1, 100)) + "\n      active: " + str(random.choice([True, False])).lower() + "\n")

print("Generating Python...")
with open("sample.py", "w") as f:
    f.write("\"\"\"Large Python Automation Script\"\"\"\nimport os\nimport sys\n\nclass DataProcessor:\n    def __init__(self, name):\n        self.name = name\n        self.results = []\n\n")
    for i in range(150):
        f.write("    def process_node_" + str(i) + "(self, data):\n        \"\"\"Process node " + str(i) + "\"\"\"\n        print(f'Processing " + str(i) + " in {self.name}')\n")
        f.write("        val = data * " + str(random.random()) + "\n        self.results.append(val)\n        return val\n\n")
    f.write("if __name__ == '__main__':\n    p = DataProcessor('Main')\n")
    for i in range(150):
        f.write("    p.process_node_" + str(i) + "(" + str(i) + ")\n")
    f.write("    print('Done.')\n")


print("Generating XML...")
with open("sample.xml", "w") as f:
    f.write('<?xml version="1.0" encoding="UTF-8"?>\n<Database>\n')
    for i in range(50): # ~2.5 pages
        f.write('  <Record id="' + str(i) + '">\n')
        f.write('    <Info>' + generate_random_paragraph(1, 5) + '</Info>\n')
        f.write('    <Data>' + generate_long_text_line(100) + '</Data>\n')
        f.write('  </Record>\n')
    f.write('</Database>\n')
# Also create explicitly named 2-page version
os.system('cp sample.xml sample_2page.xml')

print("Generating HTML...")
with open("sample.html", "w") as f:
    f.write('<!DOCTYPE html>\n<html>\n<head>\n  <title>Large Sample Page</title>\n  <style>\n    body { font-family: sans-serif; }\n    .item { margin: 10px; padding: 10px; border: 1px solid #ccc; }\n  </style>\n</head>\n<body>\n  <h1>Auto-generated Gallery</h1>\n')
    for i in range(100):
        f.write(f'  <div class="item" id="item-{i}">\n')
        f.write(f'    <h2>Section {i}</h2>\n')
        f.write(f'    <p>{generate_random_paragraph()}</p>\n')
        f.write(f'    <pre>{generate_long_text_line(80)}</pre>\n')
        f.write('  </div>\n')
    f.write('</body>\n</html>\n')
# Also htm
os.system('cp sample.html sample.htm')

print("Generating CSS...")
with open("sample.css", "w") as f:
    f.write("/* Extensive CSS Stylesheet */\n")
    for i in range(300):
        f.write(f".element-{i} {{\n")
        f.write(f"  color: #{random.randint(0, 0xFFFFFF):06x};\n")
        f.write(f"  margin: {random.randint(0, 50)}px;\n")
        f.write(f"  border: {random.randint(1, 5)}px solid black;\n")
        f.write(f"  z-index: {i};\n")
        f.write("}\n\n")

print("Generating INI...")
with open("sample.ini", "w") as f:
    for s in range(50):
        f.write(f"[Section_{s}]\n")
        for k in range(20):
            f.write(f"key_{k} = {generate_long_text_line(50)}\n")
        f.write("\n")

print("Generating PowerShell (ps1)...")
with open("sample.ps1", "w") as f:
    f.write("# PowerShell Large Sample\n")
    f.write("function Invoke-LargeBatch {\n")
    for i in range(100):
        f.write(f"    Write-Host \"Processing batch item {i}...\"\n")
        f.write(f"    $data_{i} = \"{generate_long_text_line(50)}\"\n")
    f.write("}\n\nInvoke-LargeBatch\n")

print("Generating Shell (sh)...")
with open("sample.sh", "w") as f:
    f.write("#!/bin/bash\n# Shell Large Sample\n")
    for i in range(100):
        f.write(f"echo \"Step {i} starting...\"\n")
        f.write(f"DEBUG_VAR_{i}=\"{generate_long_text_line(100)}\"\n")
    f.write("echo \"All steps complete.\"\n")

print("Generating R (r)...")
with open("sample.r", "w") as f:
    f.write("# R Large Sample Script\n")
    f.write("# This script simulates a large dataset and performs basic statistical analysis.\n\n")
    f.write("library(dplyr)\nlibrary(ggplot2)\n\n")
    f.write("# Set seed for reproducibility\nset.seed(42)\n\n")
    f.write("# Initialize an empty list to store results\nresults_list <- list()\n\n")
    for i in range(150):
        f.write(f"# --- Batch Process {i + 1} ---\n")
        f.write(f"cat('Starting processing for batch {i + 1}...\\n')\n")
        f.write(f"simulated_data_{i} <- data.frame(\n")
        f.write(f"  id = 1:1000,\n")
        f.write(f"  group = sample(LETTERS[1:4], 1000, replace = TRUE),\n")
        f.write(f"  value_x = rnorm(1000, mean = {random.randint(10, 50)}, sd = {random.randint(1, 10)}),\n")
        f.write(f"  value_y = runif(1000, min = 0, max = 100)\n")
        f.write(")\n\n")
        f.write(f"# Calculate summary statistics\n")
        f.write(f"summary_{i} <- simulated_data_{i} %>%\n")
        f.write("  group_by(group) %>%\n")
        f.write("  summarise(\n    mean_x = mean(value_x),\n    sd_x = sd(value_x),\n    cor_xy = cor(value_x, value_y)\n  )\n\n")
        f.write(f"results_list[[{i + 1}]] <- summary_{i}\n\n")
    f.write("# Combine all results\nfinal_results <- bind_rows(results_list)\n")
    f.write("print(head(final_results))\n\n")
    f.write("# Plotting final summary\n")
    f.write("p <- ggplot(final_results, aes(x = group, y = mean_x, fill = group)) +\n")
    f.write("  geom_boxplot() +\n")
    f.write("  theme_minimal() +\n")
    f.write("  labs(title = 'Aggregated Means Across Batches', y = 'Mean X', x = 'Group')\n")
    f.write("print(p)\n")

print("Generating TSV...")
with open("sample.tsv", "w") as f:
    f.write("ID\tName\tValue\n")
    for i in range(1000):
        f.write(f"{i}\tUser_{i}\t{generate_long_text_line(100)}\n")

print("Generating TeX...")
with open("sample.tex", "w") as f:
    f.write("\\documentclass{article}\n\\begin{document}\n\\title{Large Sample Document}\n\\maketitle\n")
    for i in range(50):
        f.write(f"\\section{{Chapter {i}}}\n")
        f.write(generate_random_paragraph(10, 20) + "\n\n")
    f.write("\\end{document}\n")

print("Generating RTF...")
with open("sample.rtf", "w") as f:
    f.write("{\\rtf1\\ansi\\deff0{\\fonttbl{\\f0 Courier;}}\n")
    f.write("\\f0\\fs20 Large Rich Text Sample\\par\\par\n")
    for i in range(100):
        f.write(f"Line {i}: {generate_random_paragraph()}\\par\n")
    f.write("}")

print("Setup Complete.")

