import os

def generate_xml(filename, target_size_mb):
    target_size_bytes = target_size_mb * 1024 * 1024
    header = '<?xml version="1.0" encoding="UTF-8"?>\n<Root>\n'
    footer = '</Root>'
    
    with open(filename, 'w') as f:
        f.write(header)
        current_size = len(header)
        
        row_id = 1
        while current_size < target_size_bytes - len(footer) - 500:
            row = f'  <Item id="{row_id}">\n'
            row += f'    <Data>{"A" * 100}</Data>\n'
            row += f'    <Description>{"Random description text block " * 10}</Description>\n'
            row += f'  </Item>\n'
            f.write(row)
            current_size += len(row)
            row_id += 1
            
        f.write(footer)

print("Generating 50MB XML...")
generate_xml("sample_50mb.xml", 50)
print("Generating 95MB XML (reduced from 150MB for GitHub compatibility)...")
generate_xml("sample_150mb.xml", 95)
print("Done.")
