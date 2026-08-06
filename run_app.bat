@echo off
chcp 65001 > nul
echo ===================================================
echo 正在啟動 化學藥物調配室作業 Check List 本地預覽...
echo ===================================================
echo.

:: 檢查 Python 是否安裝
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [錯誤] 系統未偵測到 Python，請先下載並安裝 Python！
    echo 官網下載網址: https://www.python.org/
    echo 注意：安裝時請務必勾選 "Add python.exe to PATH"
    pause
    exit /b
)

:: 建立虛擬環境 (如果不存在)
if not exist "venv" (
    echo [1/3] 正在建立 Python 虛擬環境 (venv)...
    python -m venv venv
)

:: 啟用虛擬環境
call venv\Scripts\activate.bat

:: 安裝所需套件
echo [2/3] 正在檢查並安裝需求套件 (streamlit)...
pip install --upgrade pip >nul 2>&1
pip install -r requirements.txt

:: 啟動 Streamlit
echo.
echo [3/3] 正在啟動 Streamlit 網頁服務...
echo 網頁開啟後，您可以按下 Ctrl+C 來停止服務。
echo ===================================================
streamlit run app.py

pause
