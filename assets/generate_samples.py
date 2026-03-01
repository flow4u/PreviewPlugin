import random
import string
import csv
import json

def generate_random_paragraph(num_sentences=5, max_words=20):
    sentences = []
    for _ in range(num_sentences):
        words = [''.join(random.choices(string.ascii_lowercase, k=random.randint(3, 10))) for _ in range(random.randint(5, max_words))]
        words[0] = words[0].capitalize()
        sentences.append(' '.join(words) + '.')
    return ' '.join(sentences)

def generate_long_text_line(length=500):
    return ''.join(random.choices(string.ascii_letters + string.digits + " ,.;:", k=length))

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
        f.write(f"  {{ id: {i}, config: '{generate_long_text_line(150)}', flag: {str(random.choice([True, False])).lower()} }},\n")
    f.write("];\n\n")
    f.write("function processData(store) {\n")
    for i in range(100):
        f.write(f"    console.log('Processing step {i}'); store.forEach(item => item.flag = !item.flag);\n")
    f.write("}\nprocessData(dataStore);\n")

print("Generating JSON...")
large_json = [{"id": i, "details": generate_random_paragraph(), "blob": generate_long_text_line(200)} for i in range(1000)]
with open("sample.json", "w") as f:
    json.dump(large_json, f, indent=2)

print("Setup Complete.")
