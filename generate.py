import os
import re
from PIL import Image, ImageDraw

def hex_to_rgb(hex_str):
    hex_str = hex_str[2:] # skip FF (alpha)
    return tuple(int(hex_str[i:i+2], 16) for i in (0, 2, 4))

def create_gradient_image(c1_hex, c2_hex, filename, width=150, height=30):
    img = Image.new('RGB', (width, height))
    draw = ImageDraw.Draw(img)
    color1 = hex_to_rgb(c1_hex)
    color2 = hex_to_rgb(c2_hex)
    
    for x in range(width):
        r = int(color1[0] + (color2[0] - color1[0]) * x / width)
        g = int(color1[1] + (color2[1] - color1[1]) * x / width)
        b = int(color1[2] + (color2[2] - color1[2]) * x / width)
        draw.line([(x, 0), (x, height)], fill=(r, g, b))
    
    img.save(filename)

os.makedirs('doc/assets/gradients', exist_ok=True)

with open('lib/src/theme/stylix_gradients.dart', 'r', encoding='utf-8') as f:
    content = f.read()

pattern = re.compile(r"StylixGradient\(\s*id:\s*'([^']+)',\s*name:\s*'([^']+)',\s*c1:\s*Color\(0x([0-9A-Fa-f]{8})\),\s*c2:\s*Color\(0x([0-9A-Fa-f]{8})\)")
matches = pattern.findall(content)

md_lines = []
for idx, (grad_id, name, c1, c2) in enumerate(matches):
    filename = f'doc/assets/gradients/{grad_id}.png'
    create_gradient_image(c1, c2, filename)
    # Using absolute raw github path for pub.dev compatibility
    url = f"https://raw.githubusercontent.com/raouf-elmeddah/stylix_ui/main/doc/assets/gradients/{grad_id}.png"
    md_lines.append(f"![{name}]({url})")

brands_md = """
**Available Brands:**
<br/>
![Default](https://img.shields.io/badge/-Default-0055FF?style=for-the-badge)
![Jade Canopy](https://img.shields.io/badge/-Jade_Canopy-1F4D3A?style=for-the-badge)
![Imperial Nova](https://img.shields.io/badge/-Imperial_Nova-3A2E7A?style=for-the-badge)
![Rouge Synth](https://img.shields.io/badge/-Rouge_Synth-7A294D?style=for-the-badge)
![Midnight Armor](https://img.shields.io/badge/-Midnight_Armor-1B365D?style=for-the-badge)
![Toxic Flora](https://img.shields.io/badge/-Toxic_Flora-556B2F?style=for-the-badge)
<br/>
![Arctic Forge](https://img.shields.io/badge/-Arctic_Forge-FE2E39?style=for-the-badge)
![Skyline Pulse](https://img.shields.io/badge/-Skyline_Pulse-0239FF?style=for-the-badge)
![Neon Velvet](https://img.shields.io/badge/-Neon_Velvet-2E0F36?style=for-the-badge)
![Violet Alloy](https://img.shields.io/badge/-Violet_Alloy-3E0079?style=for-the-badge)
![Phantom Mint](https://img.shields.io/badge/-Phantom_Mint-050505?style=for-the-badge)
![Ember Core](https://img.shields.io/badge/-Ember_Core-FF902F?style=for-the-badge)
<br/>
![Royal Blush](https://img.shields.io/badge/-Royal_Blush-3447AA?style=for-the-badge)
![Deep Forest](https://img.shields.io/badge/-Deep_Forest-9FE870?style=for-the-badge)
![Tidal Mist](https://img.shields.io/badge/-Tidal_Mist-BDD9D7?style=for-the-badge)
![Solar Eclipse](https://img.shields.io/badge/-Solar_Eclipse-FCDB32?style=for-the-badge)
![Neon Tide](https://img.shields.io/badge/-Neon_Tide-34E0A1?style=for-the-badge)
![Lavender Pulse](https://img.shields.io/badge/-Lavender_Pulse-6260FF?style=for-the-badge)
"""

with open('README.md', 'r', encoding='utf-8') as f:
    readme = f.read()

import re
readme = re.sub(
    r'\*\*Available Brands:\*\*\n`Default`.*?`Lavender Pulse`\.',
    brands_md.strip(),
    readme,
    flags=re.DOTALL
)

gradients_md = "Need a beautiful background for a splash screen, onboarding, or a premium card? Stylix includes over 40 hand-crafted gradients.\n\n"
for i in range(0, len(md_lines), 4):
    gradients_md += " ".join(md_lines[i:i+4]) + " <br/>\n"

readme = re.sub(
    r'Need a beautiful background for a splash screen, onboarding, or a premium card\? Stylix includes over 40 hand-crafted gradients\.',
    gradients_md.strip(),
    readme
)

with open('README.md', 'w', encoding='utf-8', newline='\n') as f:
    f.write(readme)

