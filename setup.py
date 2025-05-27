import os

import requests

# GitHub raw URL to latest _JXON.ahk
JXON_URL = "https://github.com/TheArkive/JXON_ahk2/blob/master/_JXON.ahk?raw=true"
LOCAL_FILENAME = "_JXON.ahk"


def fetch_latest_jxon():
    print(f"Fetching latest _JXON.ahk from {JXON_URL}")
    try:
        response = requests.get(JXON_URL)
        response.raise_for_status()
        new_content = response.text

        # Check if file exists
        if os.path.exists(LOCAL_FILENAME):
            with open(LOCAL_FILENAME, "r", encoding="utf-8") as f:
                current_content = f.read()
            if current_content == new_content:
                print("✅ _JXON.ahk is already up-to-date.")
                return
            else:
                print("🆕 Updating _JXON.ahk...")
        else:
            print("⬇️ Downloading _JXON.ahk...")

        # Write new content
        with open(LOCAL_FILENAME, "w", encoding="utf-8") as f:
            f.write(new_content)
        print("✅ _JXON.ahk updated successfully.")

    except Exception as e:
        print("❌ Failed to fetch _JXON.ahk:", str(e))


if __name__ == "__main__":
    fetch_latest_jxon()
