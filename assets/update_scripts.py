import random
import string

def generate_very_long_line(length=1200):
    return "".join(random.choices(string.ascii_letters + string.digits + " _-", k=length))

def update_script(filename, comment_style, name="Script"):
    with open(filename, "w") as f:
        f.write(f"{comment_style} Very Long {name} Sample (>2 Pages)\n")
        f.write(f"{comment_style} Purpose: stress test rendering, wrapping, and themes.\n\n")
        
        for i in range(250):
            if i % 20 == 0:
                f.write(f"\n{comment_style} --- Block {i // 20} ---\n")
                f.write(f"const longLabel_{i} = \"{generate_very_long_line(800)}\";\n" if filename.endswith('.js') else f"long_var_{i} = \"{generate_very_long_line(800)}\"\n")
            
            if filename.endswith('.py'):
                f.write(f"def func_{i}():\n    print('Doing thing {i}')\n    return '{generate_very_long_line(150)}'\n\n")
            elif filename.endswith('.js'):
                f.write(f"function action_{i}() {{\n    console.log('Action {i}');\n    return `{generate_very_long_line(150)}`;\n}}\n\n")
            elif filename.endswith('.sh'):
                f.write(f"echo \"Step {i}\" && sleep 0.001 # {generate_very_long_line(100)}\n")

print("Updating sample.py...")
update_script("sample.py", "#", "Python")
print("Updating sample.js...")
update_script("sample.js", "//", "JavaScript")
print("Updating sample.sh...")
update_script("sample.sh", "#", "Shell")

print("Scripts updated.")
