# -*- coding: utf-8 -*-
from PIL import Image
import sys
import os

def set_non_zero_alpha_to_252(image_path):
    try:
        # Open the image and ensure it has an Alpha channel (RGBA)
        img = Image.open(image_path).convert("RGBA")
        datas = img.getdata()

        new_data = []
        for item in datas:
            # item is a tuple: (R, G, B, A)
            r, g, b, a = item
            # If alpha is not 0 (i.e., not completely empty/transparent)
            if a != 0:
                # Set alpha to 252, keeping RGB colors untouched
                new_data.append((r, g, b, 252))
            else:
                # Keep completely transparent pixels as they are
                new_data.append(item)

        # Update image data and save it back
        img.putdata(new_data)
        
        # Save over the original file (or you can change the output path)
        img.save(image_path, "PNG")
        print(f"Successfully processed: {image_path}")

    except Exception as e:
        print(f"Error processing {image_path}: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python Pillow.py <image_path_or_folder>")
        sys.exit(1)

    target = sys.argv[1]

    if os.path.isfile(target):
        set_non_zero_alpha_to_252(target)
    elif os.path.isdir(target):
        for root, dirs, files in os.walk(target):
            for file in files:
                if file.lower().endswith(('.png', '.webp')):
                    set_non_zero_alpha_to_252(os.path.join(root, file))
    else:
        print("Invalid path provided.")