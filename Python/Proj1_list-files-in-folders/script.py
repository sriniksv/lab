import os
def main ():
    folder_paths = input("enter folder path").split()
    for folder_path in folder_paths:
      files, error_message = error_handling(folder_path)
      if files:
        print(f"Files in {folder_path}:")
        for file in files:
            print (file)
      else:
        print(f"Error in {folder_path}: {error_message}")

def error_handling(folder_path):
    try:
        files = os.listdir(folder_path)
        return files,None
    except FileNotFoundError:
        return None, "directory not found"
    except PermissionError:
        return None, "permission Denied"

if __name__ == "__main__":
    main()