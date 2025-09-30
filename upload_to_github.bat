@echo off
REM File: upload_to_github.bat
REM 用法: upload_to_github.bat [GitHub用户名] [仓库名]
REM 示例: upload_to_github.bat yourusername Medical_AI_Agent

setlocal enabledelayedexpansion

REM 配置区域
set DEFAULT_USERNAME=yourusername
set DEFAULT_REPO_NAME=Medical_AI_Agent
set GITHUB_DOMAIN=github.com

REM 颜色定义 (Windows 10+)
for /f %%i in ('echo prompt $E ^| cmd') do set "ESC=%%i"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "RED=%ESC%[31m"
set "RESET=%ESC%[0m"

REM 获取参数
set GITHUB_USERNAME=%1
set REPO_NAME=%2

if "%GITHUB_USERNAME%"=="" set GITHUB_USERNAME=%DEFAULT_USERNAME%
if "%REPO_NAME%"=="" set REPO_NAME=%DEFAULT_REPO_NAME%

REM 显示帮助
if "%1"=="-h" goto :help
if "%1"=="--help" goto :help

echo %GREEN%🚩 Medical AI Agent GitHub 上传脚本%RESET%
echo ========================================
echo ⚙️ 配置:
echo  - GitHub 用户名: %GITHUB_USERNAME%
echo  - 仓库名称    : %REPO_NAME%
echo  - 仓库地址    : https://%GITHUB_DOMAIN%/%GITHUB_USERNAME%/%REPO_NAME%
echo ========================================

REM 检查依赖
echo %GREEN%🔍 检查依赖...%RESET%
where git >nul 2>&1
if errorlevel 1 (
    echo %RED%❌ 未找到 git，请先安装 Git%RESET%
    pause
    exit /b 1
)

where python >nul 2>&1
if errorlevel 1 (
    where python3 >nul 2>&1
    if errorlevel 1 (
        echo %RED%❌ 未找到 python，请先安装 Python%RESET%
        pause
        exit /b 1
    )
)

REM 检查项目结构
echo %GREEN%🔍 检查项目结构...%RESET%
if not exist "main.py" (
    echo %RED%❌ 未找到 main.py，请在项目根目录下运行此脚本%RESET%
    pause
    exit /b 1
)

if not exist "frontend" (
    echo %RED%❌ 未找到 frontend 目录，请在项目根目录下运行此脚本%RESET%
    pause
    exit /b 1
)

REM 创建 .gitignore
echo %GREEN%🛡️ 创建 .gitignore 文件...%RESET%
(
echo.
echo # Medical AI Agent Ignore Rules
echo # Added by upload script
echo.
echo # IDE files
echo .idea/
echo .vscode/
echo *.code-workspace
echo *.swp
echo *.swo
echo.
echo # Python compiled files
echo __pycache__/
echo *.py[cod]
echo *.pyd
echo *.pyo
echo *.so
echo *.egg
echo *.egg-info/
echo dist/
echo build/
echo.
echo # Virtual environments
echo venv/
echo env/
echo .venv/
echo .env/
echo medical_ai_agent/
echo.
echo # Jupyter Notebook checkpoints
echo .ipynb_checkpoints/
echo *.ipynb_checkpoints
echo.
echo # Log files
echo logs/
echo *.log
echo log/
echo.
echo # Environment variables and secrets
echo .env
echo .env.local
echo .env.production
echo .secret
echo config.py
echo secrets.json
echo.
echo # API Keys and sensitive data
echo *.key
echo *.pem
echo *.p12
echo *.pfx
echo.
echo # OS generated files
echo .DS_Store
echo Thumbs.db
echo desktop.ini
echo *.tmp
echo *.temp
echo.
echo # Coverage and testing
echo .coverage
echo htmlcov/
echo .pytest_cache/
echo .tox/
echo .mypy_cache/
echo.
echo # Node.js ^(for frontend^)
echo node_modules/
echo npm-debug.log*
echo yarn-debug.log*
echo yarn-error.log*
echo .npm
echo .yarn
echo.
echo # Frontend build files
echo frontend/dist/
echo frontend/build/
echo frontend/.nuxt/
echo frontend/.next/
echo frontend/.cache/
echo.
echo # Medical AI specific
echo test_images/
echo test_documents/
echo uploads/
echo temp/
echo cache/
echo *.dcm
echo *.dicom
echo.
echo # Database files
echo *.db
echo *.sqlite
echo *.sqlite3
echo.
echo # Backup files
echo *.bak
echo *.backup
echo *.old
) >> .gitignore

REM 创建 README.md
echo %GREEN%📄 创建 README.md 文件...%RESET%
if not exist "README.md" (
    (
    echo # Medical AI Agent
    echo.
    echo 一个基于FastAPI和uni-app的智能医疗助手系统，提供多种AI医疗功能。
    echo.
    echo ## 🚀 功能特性
    echo.
    echo - **智能问诊**: AI医疗助手提供专业健康咨询
    echo - **智能分诊**: 根据症状推荐合适科室
    echo - **症状自诊**: 分析可能疾病并提供建议
    echo - **报告解读**: 解读医学检查报告
    echo - **皮肤病咨询**: 基于图片的皮肤病分析
    echo - **病例整理**: 生成结构化病历信息
    echo - **健康教育**: 提供医疗知识科普
    echo.
    echo ## 🏗️ 技术架构
    echo.
    echo ### 后端 ^(FastAPI^)
    echo - **框架**: FastAPI + Python 3.8+
    echo - **AI模型**: 阿里云百炼 ^(Dashscope^)
    echo - **数据库**: 支持多种数据库
    echo - **API**: RESTful API设计
    echo.
    echo ### 前端 ^(uni-app^)
    echo - **框架**: uni-app + Vue 3
    echo - **UI库**: uview-plus
    echo - **构建工具**: Vite
    echo - **样式**: SCSS
    echo.
    echo ## 📦 安装部署
    echo.
    echo ### 后端部署
    echo.
    echo 1. **克隆项目**
    echo ```bash
    echo git clone https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git
    echo cd %REPO_NAME%
    echo ```
    echo.
    echo 2. **安装依赖**
    echo ```bash
    echo pip install -r requirements.txt
    echo ```
    echo.
    echo 3. **配置环境**
    echo ```bash
    echo # 复制配置文件
    echo cp config.py.example config.py
    echo # 编辑配置文件，填入API密钥
    echo ```
    echo.
    echo 4. **启动服务**
    echo ```bash
    echo python run.py
    echo ```
    echo.
    echo ### 前端部署
    echo.
    echo 1. **进入前端目录**
    echo ```bash
    echo cd frontend
    echo ```
    echo.
    echo 2. **安装依赖**
    echo ```bash
    echo npm install
    echo ```
    echo.
    echo 3. **开发模式**
    echo ```bash
    echo npm run dev:h5
    echo ```
    echo.
    echo 4. **生产构建**
    echo ```bash
    echo npm run build:h5
    echo ```
    echo.
    echo ## 🔧 配置说明
    echo.
    echo ### 后端配置 ^(config.py^)
    echo.
    echo ```python
    echo # 阿里云百炼API配置
    echo DASHSCOPE_API_KEY = "your-api-key"
    echo TEXT_MODEL = "qwen-plus"
    echo VISION_MODEL = "qwen-vl-plus"
    echo ```
    echo.
    echo ### 前端配置 ^(frontend/src/api/index.js^)
    echo.
    echo ```javascript
    echo // API地址配置
    echo const API_BASE_URL = process.env.NODE_ENV === 'development'
    echo   ? 'http://127.0.0.1:8000'
    echo   : 'https://your-domain.com'
    echo ```
    echo.
    echo ## 📚 API文档
    echo.
    echo 启动后端服务后，访问 `http://localhost:8000/docs` 查看API文档。
    echo.
    echo ### 主要接口
    echo.
    echo - `POST /api/medical-chat` - 智能问诊
    echo - `POST /api/report-interpretation` - 报告解读
    echo - `POST /api/dermatology-consultation` - 皮肤病咨询
    echo.
    echo ## 🤝 贡献指南
    echo.
    echo 1. Fork 本仓库
    echo 2. 创建特性分支 ^(`git checkout -b feature/AmazingFeature`^)
    echo 3. 提交更改 ^(`git commit -m 'Add some AmazingFeature'`^)
    echo 4. 推送到分支 ^(`git push origin feature/AmazingFeature`^)
    echo 5. 打开 Pull Request
    echo.
    echo ## 📄 许可证
    echo.
    echo 本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。
    echo.
    echo ## 📞 联系方式
    echo.
    echo 如有问题或建议，请通过以下方式联系：
    echo.
    echo - 提交 Issue
    echo - 发送邮件至: your-email@example.com
    echo.
    echo ## 🙏 致谢
    echo.
    echo 感谢以下开源项目的支持：
    echo - [FastAPI](https://fastapi.tiangolo.com/^)
    echo - [uni-app](https://uniapp.dcloud.net.cn/^)
    echo - [uview-plus](https://www.uviewui.com/^)
    echo - [阿里云百炼](https://dashscope.aliyun.com/^)
    ) > README.md
)

REM 创建 LICENSE
echo %GREEN%📄 创建 MIT LICENSE 文件...%RESET%
if not exist "LICENSE" (
    (
    echo MIT License
    echo.
    echo Copyright ^(c^) 2024 Medical AI Agent
    echo.
    echo Permission is hereby granted, free of charge, to any person obtaining a copy
    echo of this software and associated documentation files ^(the "Software"^), to deal
    echo in the Software without restriction, including without limitation the rights
    echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    echo copies of the Software, and to permit persons to whom the Software is
    echo furnished to do so, subject to the following conditions:
    echo.
    echo The above copyright notice and this permission notice shall be included in all
    echo copies or substantial portions of the Software.
    echo.
    echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    echo SOFTWARE.
    ) > LICENSE
)

REM 初始化 Git 仓库
echo %GREEN%🆕 初始化 Git 仓库...%RESET%
if not exist ".git" (
    git init
)

REM 设置远程仓库
git remote remove origin >nul 2>&1
git remote add origin https://%GITHUB_DOMAIN%/%GITHUB_USERNAME%/%REPO_NAME%.git

REM 配置 Git 用户信息
git config user.name "%GITHUB_USERNAME%"
git config user.email "%GITHUB_USERNAME%@users.noreply.%GITHUB_DOMAIN%"

REM 清理临时文件
echo %GREEN%🗑️ 清理临时文件...%RESET%
for /r . %%f in (*.pyc) do del "%%f" 2>nul
for /d /r . %%d in (__pycache__) do rmdir /s /q "%%d" 2>nul
for /r . %%f in (.DS_Store) do del "%%f" 2>nul

REM 添加所有文件
echo %GREEN%📦 添加文件到 Git...%RESET%
git add --all

REM 提交更改
echo %GREEN%💾 提交更改...%RESET%
git commit -m "Initial commit: Medical AI Agent project

- 智能医疗助手后端系统 (FastAPI)
- 前端界面 (uni-app + Vue 3)
- 多种AI医疗功能模块
- 完整的项目文档和配置" --allow-empty

REM 推送到 GitHub
echo %GREEN%🚀 推送到 GitHub...%RESET%
git branch -M main >nul 2>&1

git push -u origin main --force
if errorlevel 1 (
    echo %YELLOW%⚠️ 推送失败! 可能仓库尚未在 GitHub 创建%RESET%
    echo %YELLOW%   请手动创建仓库: https://%GITHUB_DOMAIN%/%GITHUB_USERNAME%/%REPO_NAME%%RESET%
    echo %YELLOW%   或者检查网络连接和权限%RESET%
    pause
    exit /b 1
)

echo ========================================
echo %GREEN%🎉 上传完成！%RESET%
echo %GREEN%📖 查看仓库: https://%GITHUB_DOMAIN%/%GITHUB_USERNAME%/%REPO_NAME%%RESET%
echo.
echo %GREEN%✅ 项目已成功上传到 GitHub!%RESET%
pause
exit /b 0

:help
echo Medical AI Agent GitHub 上传脚本
echo.
echo 用法:
echo   %~nx0 [GitHub用户名] [仓库名]
echo.
echo 参数:
echo   GitHub用户名    您的 GitHub 用户名
echo   仓库名          仓库名称 (默认: Medical_AI_Agent)
echo.
echo 示例:
echo   %~nx0 yourusername Medical_AI_Agent
echo   %~nx0 yourusername my-medical-ai
echo.
echo 功能:
echo   - 自动初始化 Git 仓库
echo   - 创建适合的 .gitignore 文件
echo   - 生成项目 README.md 和 LICENSE
echo   - 清理敏感文件和临时文件
echo   - 推送到 GitHub 仓库
echo.
echo 注意事项:
echo   - 请确保已在 GitHub 创建对应仓库
echo   - 确保有推送权限
echo   - 敏感信息 (如 API 密钥) 会被自动忽略
pause
exit /b 0
