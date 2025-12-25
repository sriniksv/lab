#replicated on my one
import os
def main():
    folder_paths = input("enter folder paths").split()
    for folder_path in folder_paths:
        files, error_msg = error_handling(folder_path)
        if files:
            print(f"files in {folder_path}:")
            for file in files:
                print(file)
        else:
            print(f"{folder_path}{error_msg}")

def error_handling(folder_path):
    try:
        file = os.listdir(folder_path)
        return file,None
    except PermissionError:
        return None,"Permission Denied"
    except FileNotFoundError:
        return None, "Folder Not Found"

if __name__ == "__main__":
    main()