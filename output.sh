#!/bin/bash

# パスワード情報を保存するファイル名
password_file="data.txt"

while true; do
  echo "次の選択肢から入力してください (Get Password/Exit):"
  read choice

  if [ "$choice" = "Get Password" ]; then
    # サービス名を入力
    read -p "サービス名を入力してください: " service_name

    # パスワード情報を検索
    user_name=$(grep "$service_name" "$password_file" | cut -d : -f 2)
    password=$(grep "$service_name" "$password_file" | cut -d : -f 3)

    if [ -n "$user_name" ]; then
      echo "サービス名: $service_name"
      echo "ユーザー名: $user_name"
      echo "パスワード: $password"
    else
      echo "そのサービスは登録されていません。"
    fi
  elif [ "$choice" = "Exit" ]; then
    break  # プログラムを終了
  else
    echo "無効な選択肢です。もう一度選択してください。"
  fi
done

