## Checking the user meets both parameters:
if [ "$#" -ne 2 ]; then
    echo "Please check the format."
    echo "Example: \"sh. /hw1.sh git_url folder_path\""
    exit 1
fi

git_url=$1
folder_path=$2

## If the folder does not exist, clone it
if [ ! -d "$folder_path" ]; then
    git clone "$git_url" "$folder_path"

    if [ $? -eq 0 ]; then 
        echo "Success: Cloned from $git_url to $folder_path"

    else
        echo "Failed to Clone from $git_url to $folder_path"
    fi
fi 

## If folder exists, pull the latest changes
else
    cd "$folder_path"
    git pull "$git_url"

if [ $? -eq 0 ]; then
    echo "Success: Pulled from $git_url to $folder_path"

else
    echo "Failed to pull from $git_url to $folder_path"
    exit 1
    fi
fi
ls -la "$folder_path"