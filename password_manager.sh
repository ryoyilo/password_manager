#!/bin/bash

# パスワード情報を保存するファイル名
password_file="data.txt"

echo "パスワードマネージャーへようこそ！"

while true; do

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" choice

if [ "$choice" = "Add Password" ]; then
	# Add Password が入力された場合
	read -p " サービス名を入力してください：" service_name
	read -p "ユーザー名を入力してください：" user_name
	read -p "パスワードを入力してください：" password
	## データをファイルに追加
	echo $service_name:$user_name:$password >> "$password_file"
	## 入力が完了したら
	echo Thank you!

elif [ "$choice" = "Get Password" ]; then
	# Get Password が入力された場合
	## サービス名を入力
       	read -p "サービス名を入力してください: " service_name
       
	## パスワード情報を検索
	user_name=$(grep "$service_name" "$password_file" | cut -d : -f 2)
       	password=$(grep "$service_name" "$password_file" | cut -d : -f 3)

    if [ -n "$user_name" ]; then
	    ## サービス名が保存されていた場合
	    echo "サービス名: $service_name"
	    echo "ユーザー名: $user_name"
	    echo "パスワード: $password"

    else
	    ## サービス名が保存されていなかった場合
	    echo "そのサービスは登録されていません。"
   
    fi

elif [ "$choice" = "Exit" ]; then
	# Exit が入力された場合
	echo "Thank you!"
	exit ##プログラが終了
else
	# Add Password/Get Password/Exit 以外が入力された場合
	 echo "無効な選択肢です。もう一度選択してください。"
fi
done
