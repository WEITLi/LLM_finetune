#!/bin/bash

# 言界英语学习助手 - 模型下载脚本
# 创建必要的目录结构

echo "🚀 开始下载言界项目所需模型..."

# 创建目录结构
mkdir -p LLM/model
mkdir -p TTS/weights/ChatTTS
mkdir -p TTS/weights/speaker
mkdir -p ASR/SenseVoiceSmall
mkdir -p THG/EchoMimic
mkdir -p Work_dirs/TTS
mkdir -p Work_dirs/ASR

echo "📁 目录结构创建完成"

# 安装git-lfs
echo "🔧 安装git-lfs..."
git lfs install

echo "=" * 50
echo "📥 开始下载模型文件..."

# 1. LLM模型下载 (InternLM)
echo "🧠 下载LLM模型 (InternLM)..."
cd LLM/model
# 使用OpenXLab镜像下载（更稳定）
git clone https://code.openxlab.org.cn/Alannikos/yanjie_1_8b.git .
git lfs pull
cd ../../

# 2. TTS模型下载 (ChatTTS)
echo "🎵 下载TTS模型 (ChatTTS)..."
cd TTS/weights
# 使用HuggingFace镜像
git clone https://hf-mirror.com/2Noise/ChatTTS ./ChatTTS
# 或者使用原始地址（可能需要代理）
# git clone https://huggingface.co/2Noise/ChatTTS ./ChatTTS
cd ChatTTS && git lfs pull
cd ../../../

# 3. ASR模型下载 (SenseVoiceSmall)
echo "🎤 下载ASR模型 (SenseVoiceSmall)..."
cd ASR
# 使用HuggingFace镜像
git clone https://hf-mirror.com/FunAudioLLM/SenseVoiceSmall ./SenseVoiceSmall
# 或者使用原始地址
# git clone https://huggingface.co/FunAudioLLM/SenseVoiceSmall ./SenseVoiceSmall
cd SenseVoiceSmall && git lfs pull
cd ../../

# 4. THG模型下载 (EchoMimic) - 数字人
echo "👤 下载THG模型 (EchoMimic)..."
cd THG
# 使用HuggingFace镜像
git clone https://hf-mirror.com/BadToBest/EchoMimic ./EchoMimic
# 或者使用原始地址
# git clone https://huggingface.co/BadToBest/EchoMimic ./EchoMimic
cd EchoMimic && git lfs pull
cd ../../

echo "=" * 50
echo "✅ 所有模型下载完成！"

# 检查模型文件
echo "🔍 检查模型文件..."
echo "LLM模型目录:"
ls -la LLM/model/
echo ""

echo "TTS模型目录:"
ls -la TTS/weights/ChatTTS/
echo ""

echo "ASR模型目录:"
ls -la ASR/SenseVoiceSmall/
echo ""

echo "THG模型目录:"
ls -la THG/EchoMimic/
echo ""

echo "🎉 模型下载脚本执行完成！"
echo "现在可以运行: streamlit run app.py" 