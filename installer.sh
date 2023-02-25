
echo "# Installing JDX Extension for VS Code"
echo "# Contact the Platform Health team for support and request updates"


if [ "$1" = "-c" ]
then
    
    package=$(npm list -g | grep vsce)
    if [ -z "$package"  ]
    then
        echo "# Installing the extension compiler vsce"
        #npm install vsce
    else
        echo "# Compiler already installed"
    fi
    npm install
    ./node_modules/@vscode/vsce/vsce package --allow-star-activation -o "releases/" # Generates a .vsix file
    
fi


cd releases/
latest=$(ls -ar | grep "jdx-extension" | head -n 1)

echo " "
echo "# Instaling latest version : $latest"

# code --install-extension $latest #Install only the latest version