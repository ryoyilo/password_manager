echo "パスワードマネージャーへようこそ！"
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" choice

if [ "$choice" = "Add Password" ]; then
	./input.sh
elif [ "$choice" = "Get Password" ]; then
	./output.sh
elif [ "$choice" = "Exit" ]; then
	exit
else
	./password_manager.sh
fi
