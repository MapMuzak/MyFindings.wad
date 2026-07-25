import time
import subprocess
import shutil
import os

# --- Configuration ---
OPTIONS_PATH = r"C:\path\to\minecraft\options.txt"
BACKUP_PATH = r"C:\path\to\minecraft\options_backup.txt"
MINECRAFT_EXE_PATH = r"C:\path\to\your\Minecraft.exe"

TARGET_LINE = "keyboard_type_0_key.right:67"

def close_minecraft():
    """Force close Minecraft Bedrock so files aren't locked."""
    subprocess.run("taskkill /f /im Minecraft.Windows.exe", shell=True, capture_output=True)

def start_minecraft():
    """Launch Minecraft Bedrock using the full executable/protocol path provided."""
    try:
        subprocess.Popen([MINECRAFT_EXE_PATH])
        print("Minecraft launched successfully.")
    except Exception as e:
        print(f"Failed to launch Minecraft: {e}")

def get_target_line_value(filepath):
    """Read the file and find the specific line content."""
    if not os.path.exists(filepath):
        return None
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            if line.strip().startswith("keyboard_type_0_key.right"):
                return line.strip()
    return None

def main():
    print("Option monitor started. Press Ctrl+C to stop.")
    
    # Ensure backup exists initially
    if not os.path.exists(BACKUP_PATH) and os.path.exists(OPTIONS_PATH):
        shutil.copy(OPTIONS_PATH, BACKUP_PATH)
        print("Initial backup created.")

    while True:
        try:
            if os.path.exists(OPTIONS_PATH):
                current_value = get_target_line_value(OPTIONS_PATH)
                
                # If changed, perform the reset action
                if current_value and current_value != TARGET_LINE:
                    print(f"Detected change! Found: {current_value}")
                    print("Closing Minecraft...")
                    close_minecraft()
                    time.sleep(1)
                    
                    if os.path.exists(BACKUP_PATH):
                        print("Restoring old options.txt from backup...")
                        shutil.copy(BACKUP_PATH, OPTIONS_PATH)
                    
                    print("Restarting Minecraft...")
                    start_minecraft()
                    
                    time.sleep(5) # Cooldown to prevent loop
            
            time.sleep(1) # Check every second
            
        except Exception as e:
            print(f"An error occurred: {e}")
            time.sleep(2)

if __name__ == "__main__":
    main()
