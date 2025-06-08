# 言界英语学习助手 - 模型需求说明

## 📋 模型概览

言界项目需要4个核心AI模型来实现完整功能：

| 模块 | 模型名称 | 功能 | 存储路径 | 下载地址 |
|------|----------|------|----------|----------|
| LLM | InternLM (Yanjie_1.8B) | 对话生成 | `/LLM/model/` | https://code.openxlab.org.cn/Alannikos/yanjie_1_8b.git |
| TTS | ChatTTS | 语音合成 | `/TTS/weights/ChatTTS/` | https://huggingface.co/2Noise/ChatTTS |
| ASR | SenseVoiceSmall | 语音识别 | `/ASR/SenseVoiceSmall/` | https://huggingface.co/FunAudioLLM/SenseVoiceSmall |
| THG | EchoMimic | 数字人生成 | `/THG/EchoMimic/` | https://huggingface.co/BadToBest/EchoMimic |

## 🚀 快速部署

### 方法1：一键下载脚本
```bash
# 给脚本执行权限
chmod +x download_models.sh

# 运行下载脚本
bash download_models.sh
```

### 方法2：手动下载
```bash
# 1. 安装git-lfs
git lfs install

# 2. 创建目录
mkdir -p {LLM/model,TTS/weights/ChatTTS,TTS/weights/speaker,ASR/SenseVoiceSmall,THG/EchoMimic,Work_dirs/{TTS,ASR,THG}}

# 3. 下载LLM模型
cd LLM/model
git clone https://code.openxlab.org.cn/Alannikos/yanjie_1_8b.git .
git lfs pull
cd ../../

# 4. 下载TTS模型
cd TTS/weights
git clone https://hf-mirror.com/2Noise/ChatTTS ./ChatTTS
cd ChatTTS && git lfs pull
cd ../../../

# 5. 下载ASR模型
cd ASR
git clone https://hf-mirror.com/FunAudioLLM/SenseVoiceSmall ./SenseVoiceSmall
cd SenseVoiceSmall && git lfs pull
cd ../../

# 6. 下载THG模型
cd THG
git clone https://hf-mirror.com/BadToBest/EchoMimic ./EchoMimic
cd EchoMimic && git lfs pull
cd ../../
```

## 💾 存储需求

| 模型 | 预估大小 | 说明 |
|------|----------|------|
| InternLM | ~3.6GB | 1.8B参数量 |
| ChatTTS | ~2GB | 包含声学模型和语言模型 |
| SenseVoiceSmall | ~500MB | 轻量级ASR模型 |
| EchoMimic | ~4GB | 数字人生成模型 |
| **总计** | **~10GB** | 建议预留15GB空间 |

## 🔧 模型配置

### TTS音色文件
需要额外下载音色文件到 `/TTS/weights/speaker/`：
```bash
# 温柔御姐音色
wget -O /TTS/weights/speaker/seed_742_restored_emb.pt [音色文件URL]

# 可爱甜心音色  
wget -O /TTS/weights/speaker/seed_1089_restored_emb.pt [音色文件URL]
```

### 环境变量
```bash
export YANJIE_LLM_PATH="/LLM/model"
export YANJIE_TTS_PATH="/TTS/weights/ChatTTS"
export YANJIE_ASR_PATH="/ASR/SenseVoiceSmall"
export YANJIE_THG_PATH="/THG/EchoMimic"
```

## 📊 功能状态

| 功能模块 | 状态 | 说明 |
|----------|------|------|
| 🧠 LLM对话 | ✅ 完成 | 基于InternLM的智能对话 |
| 🎵 TTS语音合成 | ✅ 完成 | 支持多种音色 |
| 🎤 ASR语音识别 | ✅ 完成 | 支持中英文识别 |
| 🎬 数字人对话 | 🚧 开发中 | EchoMimic集成中 |

## ⚠️ 注意事项

1. **网络环境**：建议使用镜像地址下载，如遇网络问题可尝试代理
2. **存储空间**：确保有足够的磁盘空间（推荐15GB+）
3. **GPU要求**：推荐使用CUDA兼容GPU，最低8GB显存
4. **依赖环境**：确保已安装conda环境和相关依赖

## 🔍 模型验证

下载完成后，可以运行以下命令验证：
```bash
# 检查模型文件
ls -la LLM/model/
ls -la TTS/weights/ChatTTS/
ls -la ASR/SenseVoiceSmall/
ls -la THG/EchoMimic/

# 运行项目
streamlit run app.py
```

## 🆘 常见问题

**Q: 下载速度慢怎么办？**
A: 可以尝试使用hf-mirror.com镜像或配置代理

**Q: git lfs pull失败？**
A: 检查git-lfs是否正确安装，重新运行 `git lfs install`

**Q: 模型加载失败？**
A: 检查路径配置和文件完整性，确保模型文件完整下载

**Q: 显存不足？**
A: 可以在模型加载时使用`torch.float16`或`torch.bfloat16`精度 