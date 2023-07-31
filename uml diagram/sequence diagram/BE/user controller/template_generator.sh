# !/bin/bash

current_path="$(pwd)"
declare -a files=("register" "login" "update" "query" "activate" "merchantApply" "forgotPassword" "forgotPasswordQuery" "resetPassword" "emailEncrypt" "emailDecrypt")

for file in "${files[@]}"
do
    file_with_format="${file}.pu"
    # echo ${file_with_format}
    rm -f ${file_with_format}
    touch ${file_with_format}
    echo "@startuml ${file}" >> ${file_with_format}
    echo "participant \"Frontend\" as fe" >> ${file_with_format}
    echo "participant \"UserController\" as uc" >> ${file_with_format}
    echo "" >> ${file_with_format}
    echo "database \"shumishumi-db\" as db" >> ${file_with_format}
    echo "" >> ${file_with_format}
    echo "@enduml" >> ${file_with_format}
done
